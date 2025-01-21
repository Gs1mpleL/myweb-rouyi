package com.ruoyi.spider.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.ruoyi.common.core.context.SecurityContextHolder;
import com.ruoyi.common.core.exception.GlobalException;
import com.ruoyi.spider.domain.Bilibili;
import com.ruoyi.spider.mapper.BilibiliMapper;
import com.ruoyi.spider.service.BilibiliService;
import com.ruoyi.spider.utils.HttpUtils;
import com.ruoyi.spider.utils.RSAUtils;
import com.ruoyi.spider.vo.BiliUserData;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j
public class BilibiliServiceImpl implements BilibiliService {
    @Autowired
    HttpUtils httpUtils;
    @Autowired
    private BilibiliMapper bilibiliMapper;
    @Override
    public BiliUserData loginByCookie(String cookie) {
        String url = "https://api.bilibili.com/x/web-interface/nav";
        HashMap<String, String> header = new HashMap<>();
        header.put("Cookie", cookie);
        JSONObject jsonObject = httpUtils.get(url, header, null, null, JSONObject.class);
        JSONObject object = jsonObject.getJSONObject("data");
        String code = jsonObject.getString("code");
        String SUCCESS = "0";
        BiliUserData biliUserData = new BiliUserData();
        if (SUCCESS.equals(code)) {
            /* 用户名 */
            biliUserData.setUname(object.getString("uname"));
            /* 账户的uid */
            biliUserData.setMid(object.getString("mid"));
            /* vip类型 */
            biliUserData.setVipType(object.getString("vipType"));
            /* 硬币数 */
            biliUserData.setMoney(object.getString("money"));
            /* 经验 */
            biliUserData.setCurrentExp(object.getJSONObject("level_info").getString("current_exp"));
            /* 大会员状态 */
            biliUserData.setVipStatus(object.getString("vipStatus"));
            /* 钱包B币卷余额 */
            biliUserData.setCouponBalance(object.getJSONObject("wallet").getString("coupon_balance"));
        } else {
            throw new GlobalException("获取B站用户信息失败");
        }
        return biliUserData;
    }

    @Override
    public String refreshCookie() {
        Bilibili bilibili = bilibiliMapper.getBilibiliByUserId(SecurityContextHolder.getUserId());
        return refreshCookie(bilibili.getCookie(), bilibili.getRefreshToken());
    }

    public String refreshCookie(String cookie,String refreshToken) {
        HashMap<String, String> header = new HashMap<>();
        header.put("Cookie", cookie);
        JSONObject isNeedRefresh = httpUtils.get("https://passport.bilibili.com/x/passport-login/web/cookie/info", header, null, JSONObject.class);
        log.info("开始检查是否需要刷新Cookie:[{}]", isNeedRefresh);
        String s = "null";
        if (isNeedRefresh.getJSONObject("data").getString("refresh").equals("true")) {
            log.info("需要刷新，开始刷新！");

        } else {
            log.info("不需要刷新！");
            s = doRefresh(cookie,refreshToken);

        }
        return s;
    }

    @Override
    public BiliUserData loginByQR() {
        String qrcode_key = genQR();

        // 等待扫码登陆
        AtomicReference<String> cookie = new AtomicReference<>("");
        final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        CountDownLatch latch = new CountDownLatch(1);
        final int MAX_ATTEMPTS = 60;
        final AtomicInteger counter = new AtomicInteger(0);
        scheduler.scheduleAtFixedRate(() -> {
            try {
                // 发送 HTTP 请求
                JSONObject jsonObject1 = httpUtils.get("https://passport.bilibili.com/x/passport-login/web/qrcode/poll?qrcode_key=" + qrcode_key, null, null, responseEntity -> {
                    JSONObject newJsonObject = new JSONObject(responseEntity.getBody());
                    newJsonObject.putAll(responseEntity.getHeaders());
                    return newJsonObject;
                }, JSONObject.class);

                if (jsonObject1.getJSONObject("data").getString("code").equals("0")) {
                    log.info(String.valueOf(jsonObject1));
                    cookie.set(getCookieFromRespHeader(jsonObject1));
                    String refreshToken = jsonObject1.getJSONObject("data").getString("refresh_token");
                    Bilibili bilibili = new Bilibili();
                    bilibili.setRefreshToken(refreshToken);
                    bilibili.setCookie(String.valueOf(cookie));
                    bilibili.setUserId(SecurityContextHolder.getUserId());
                    bilibiliMapper.insertOrUpdateBilibiliByUserId(bilibili);
                    scheduler.shutdown(); // 登录成功后关闭调度器
                    latch.countDown();
                }
                if (counter.incrementAndGet() >= MAX_ATTEMPTS) {
                    log.info("达到最大尝试次数，登陆失败");
                    scheduler.shutdown();
                    latch.countDown();
                }
            } catch (Exception e) {
                log.error("扫码发生错误");
                e.printStackTrace();
                scheduler.shutdown();
                latch.countDown();
            }
        }, 0, 2, TimeUnit.SECONDS);
        try {
            latch.await(); // 等待登录成功
        }catch (Exception e){
            e.printStackTrace();

        }

        BiliUserData biliUserData = loginByCookie(String.valueOf(cookie));
        log.info(biliUserData.toString());
        return biliUserData;
    }

    private String genQR() {
        // 二维码生成
        JSONObject jsonObject = httpUtils.get("https://passport.bilibili.com/x/passport-login/web/qrcode/generate", null, null, JSONObject.class);
        String url = jsonObject.getJSONObject("data").getString("url");
        String qrcode_key = jsonObject.getJSONObject("data").getString("qrcode_key");
        int width = 300; // 二维码宽度
        int height = 300; // 二维码高度
        String format = "png"; // 图像格式
        Map<EncodeHintType, Object> hints = new HashMap<>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
        hints.put(EncodeHintType.MARGIN, 2);
        try {
            BitMatrix bitMatrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height, hints);
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
                }
            }
            File qrFile = new File("qrcode.png");
            ImageIO.write(image, format, qrFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return qrcode_key;
    }

    private String getCookieFromRespHeader(JSONObject jsonObject1) {
        JSONArray jsonArray = jsonObject1.getJSONArray("Set-Cookie");
        StringBuilder totalCookieBuilder = new StringBuilder();
        for (Object o : jsonArray) {
            totalCookieBuilder.append(o).append(";");
        }
        return totalCookieBuilder.deleteCharAt(totalCookieBuilder.length() - 1).toString();
    }
    private String doRefresh(String cookie,String refreshToken) {
        HashMap<String, String> header = new HashMap<>();
        header.put("Cookie",cookie);
        String url = "https://www.bilibili.com/correspond/1/" + RSAUtils.getCorrespondPath();
        String html = httpUtils.getForHtml(url, null, header);
        String refreshCsrf = getRefreshCsrf(html);
        if (refreshCsrf.isEmpty()) {
            throw new GlobalException("获取refreshCsrf失败");
        }
        String requestBody = "csrf=" + getBiliJctFromCookie(cookie)
                + "&refresh_csrf=" + refreshCsrf
                + "&source=" + "main_web"
                + "&refresh_token=" + refreshToken;
        JSONObject post = httpUtils.post("https://passport.bilibili.com/x/passport-login/web/cookie/refresh?"+requestBody, header,null,responseEntity -> {
            JSONObject newJsonObject = new JSONObject(responseEntity.getBody());
            newJsonObject.putAll(responseEntity.getHeaders());
            return newJsonObject;
        },JSONObject.class);
        log.info("Cookie刷新结果[{}]", post);
        String newRefreshToken = post.getJSONObject("data").getString("refresh_token");
        String newCookie = getCookieFromRespHeader(post);
        Bilibili bilibili = new Bilibili();
        bilibili.setUserId(SecurityContextHolder.getUserId());
        bilibili.setCookie(newCookie);
        bilibili.setRefreshToken(newRefreshToken);
        bilibiliMapper.updateBilibili(bilibili);
        log.info("Cookie更新完成!");
        return newRefreshToken;
    }
    String getBiliJctFromCookie(String cookie){
        String regStr = "bili_jct=(.*?); ";
        Pattern pattern = Pattern.compile(regStr);
        Matcher matcher = pattern.matcher(cookie);
        String biliJct = "";
        if (matcher.find()) {
            biliJct = matcher.group(0).replace("bili_jct=", "").replace("; ", "");
        } else {
            throw new GlobalException("cookie解析失败");
        }
        return biliJct;
    }
    private static String getRefreshCsrf(String html) {
        try {
            Document document = Jsoup.parse(html);
            org.jsoup.select.Elements elements = document.select("div[id='1-name']");
            return elements.text();
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new GlobalException("cookie刷新失败");
        }
    }
}
