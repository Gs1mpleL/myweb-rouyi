package com.ruoyi.wanfeng.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.context.SecurityContextHolder;
import com.ruoyi.wanfeng.domain.Weather;
import com.ruoyi.wanfeng.dto.Location;
import com.ruoyi.wanfeng.dto.PushMsg;
import com.ruoyi.wanfeng.service.PushService;
import com.ruoyi.wanfeng.service.WeatherService;
import com.ruoyi.wanfeng.utils.HttpUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;


@Service
public class WeatherServiceImpl implements WeatherService {
    @Autowired
    HttpUtils httpUtils;
    @Autowired
    PushService pushService;
    @Override
    public Weather getCurWeather(Location location) {
        String url = "https://devapi.qweather.com/v7/grid-weather/3d?location=" + location.toString();
        HashMap<String, String> header = new HashMap<>();
        header.put("X-QW-Api-Key","a8b95c42dbf74de1b0756c548af52a4e");
        String json = httpUtils.get(url, header, null, null, String.class);
        JSONObject parse = JSONObject.parseObject(json);
        JSONArray dailyArray = parse.getJSONArray("daily");

        // 获取执行当天的日期
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        Weather weather = null;
        for (int i = 0; i < dailyArray.size(); i++) {
            JSONObject dailyObj = dailyArray.getJSONObject(i);
            String fxDateStr = dailyObj.getString("fxDate");
            LocalDate fxDate = LocalDate.parse(fxDateStr, formatter);

            if (fxDate.isEqual(today)) {
                weather = new Weather();
                weather.setTextDay(dailyObj.getString("textDay"));
                weather.setTempMax(dailyObj.getString("tempMax"));
                weather.setTempMin(dailyObj.getString("tempMin"));
                break;
            }
        }
        if(SecurityContextHolder.getUserId() == 100 || SecurityContextHolder.getUserId() == 1){
            String weatherReport = getWeatherReport(parse);
            if (!weatherReport.equals("")){
                PushMsg pushMsg = new PushMsg();
                pushMsg.setBody(weatherReport);
                pushMsg.setGroup("weather");
                pushMsg.setTitle("天气预报");
                pushService.push(pushMsg);
            }
        }
        return weather;
    }

    public static String getWeatherReport(JSONObject weatherData) {
        // 获取 daily 数组
        JSONArray dailyArray = weatherData.getJSONArray("daily");

        // 获取今天的日期
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 遍历 daily 数组
        for (int i = 0; i < dailyArray.size(); i++) {
            JSONObject dayData = dailyArray.getJSONObject(i);
            String fxDate = dayData.getString("fxDate");
            String textDay = dayData.getString("textDay");

            // 解析日期
            LocalDate date = LocalDate.parse(fxDate, formatter);

            // 检查是否是今天或明天
            if (date.isEqual(today) || date.isEqual(today.plusDays(1))) {
                // 检查 textDay 是否包含雨、雪或风
                if (textDay.contains("雨") || textDay.contains("雪") || textDay.contains("风")) {
                    String result = date.getMonthValue() + "月" + date.getDayOfMonth() + "日-" + textDay;
                    if (date.isEqual(today)) {
                        result += "(今天)";
                    }
                    return result;
                }
            }
        }

        // 如果都不满足条件，返回空字符串
        return "";
    }
}
