package com.ruoyi.wanfeng.service;

import com.ruoyi.wanfeng.domain.Bilibili;
import com.ruoyi.wanfeng.vo.BiliUserData;

public interface BilibiliService {
    BiliUserData loginByCookie(String cookie);

    String refreshCookieByCurUser();

    void dailyTask();

    BiliUserData getBilibiliInfo();

    BiliUserData loginByQR(String qrcode_key);

    String genQR();
}
