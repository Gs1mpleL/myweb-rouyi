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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/bilibili")
public class BilibiliController extends BaseController {
    @Autowired
    BilibiliService bilibiliService;

    @GetMapping("/test")
    public R<?> test(){
        bilibiliService.loginByCookie("SESSDATA=0338d61c%2C1752985514%2C151be%2A11CjBgnx2L97eiurRU-BriMAzRhfRigJU9FU5_AX_TaF4zBgxRUu6KlGyNu8oB_oHsZU0SVjR2QjRvOHBhYXZBOWpDYXU4a1M2LVZGWm1FN1FfekJxNEFGdFA2andhR3VhRWVGdEprY09RanBNM0lUb0s4LVZ0Sl9BZDRCZk9uU1NnV3A0eXRRN2hnIIEC; Path=/; Domain=bilibili.com; Expires=Sun, 20 Jul 2025 04:25:14 GMT; HttpOnly; Secure;bili_jct=25cf499b31e858027a1c85e20fecef05; Path=/; Domain=bilibili.com; Expires=Sun, 20 Jul 2025 04:25:14 GMT;DedeUserID=287473737; Path=/; Domain=bilibili.com; Expires=Sun, 20 Jul 2025 04:25:14 GMT;DedeUserID__ckMd5=6119bb91868bfa11; Path=/; Domain=bilibili.com; Expires=Sun, 20 Jul 2025 04:25:14 GMT;sid=fb9udq6a; Path=/; Domain=bilibili.com; Expires=Sun, 20 Jul 2025 04:25:14 GMT");
        return R.ok();
    }

}
