package com.ruoyi.spider.service;

import com.ruoyi.spider.domain.Bilibili;
import com.ruoyi.spider.vo.BiliUserData;

import java.util.List;

public interface BilibiliService {
    BiliUserData loginByCookie(String cookie);
    String refreshCookie();
    BiliUserData loginByQR();
}
