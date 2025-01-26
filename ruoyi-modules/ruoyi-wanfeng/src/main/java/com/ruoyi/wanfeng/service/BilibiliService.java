package com.ruoyi.wanfeng.service;

import com.ruoyi.wanfeng.vo.BiliUserData;

public interface BilibiliService {
    BiliUserData loginByCookie(String cookie);

    String refreshCookieByCurUser();

    BiliUserData loginByQR();

    void dailyTask();
}
