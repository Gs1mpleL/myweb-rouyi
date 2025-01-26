package com.ruoyi.wanfeng.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.wanfeng.service.BilibiliService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bilibili")
public class BilibiliController extends BaseController {
    @Autowired
    BilibiliService bilibiliService;

    @GetMapping("/dailyTask")
    public R<?> dailyTask() {
        bilibiliService.dailyTask();
        return R.ok();
    }

}
