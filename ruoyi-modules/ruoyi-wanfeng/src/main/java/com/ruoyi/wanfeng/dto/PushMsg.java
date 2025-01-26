package com.ruoyi.wanfeng.dto;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Data
@Component
public class PushMsg {
    private String title = "网站通知";
    private String body = "";
    private String url = "";
    @Value("${push.bark.icon}")
    private String icon;
    private String group = "default";
    @Value("${push.bark.device_key}")
    private String device_key;
}
