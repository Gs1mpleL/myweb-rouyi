package com.ruoyi.wanfeng.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.wanfeng.dto.PushMsg;
import com.ruoyi.wanfeng.service.PushService;
import com.ruoyi.wanfeng.utils.HttpUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class PushServiceImpl implements PushService {
    @Autowired
    HttpUtils  httpUtils;
    @Override
    public boolean push(PushMsg pushMsg) {
        String baseUrl = "https://api.day.app/push";
        Map<String, String> params = new HashMap<>();
        params.put("title", pushMsg.getTitle());
        params.put("body", pushMsg.getBody());
        params.put("device_key", pushMsg.getDevice_key());
        params.put("icon", pushMsg.getIcon());
        params.put("group", pushMsg.getGroup());
        params.put("url", pushMsg.getUrl());
        JSONObject req = httpUtils.post(baseUrl, null, params, JSONObject.class);
        if (req.getString("message").equals("success")){
            return true;
        }
        return false;
    }
}
