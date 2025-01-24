package com.ruoyi.spider.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.spider.domain.Bilibili;
import com.ruoyi.spider.service.BilibiliService;
import com.ruoyi.spider.vo.BiliUserData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/bilibili")
public class BilibiliController extends BaseController {
    @Autowired
    BilibiliService bilibiliService;

    @GetMapping("/dailyTask")
    public R<?> dailyTask(){
        bilibiliService.dailyTask();
        return R.ok();
    }

}
