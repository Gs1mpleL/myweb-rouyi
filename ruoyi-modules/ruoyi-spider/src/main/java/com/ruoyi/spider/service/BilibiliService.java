package com.ruoyi.spider.service;

import com.ruoyi.spider.vo.BiliUserData;

public interface BilibiliService {
    BiliUserData loginByCookie(String cookie);
    String refreshCookieByCurUser();
    BiliUserData loginByQR();
    void dailyTask();
}
