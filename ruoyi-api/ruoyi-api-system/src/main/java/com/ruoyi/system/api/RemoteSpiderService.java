package com.ruoyi.system.api;

import com.ruoyi.common.core.constant.ServiceNameConstants;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.system.api.domain.SysFile;
import com.ruoyi.system.api.factory.RemoteFileFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件服务
 *
 * @author ruoyi
 */
@FeignClient(contextId = "remoteSpiderService", value = ServiceNameConstants.SPIDER_SERVICE, fallbackFactory = RemoteFileFallbackFactory.class)
public interface RemoteSpiderService
{
    /**
     * bilibili日常任务
     *
     * @return 结果
     */
    @GetMapping(value = "/bilibili/dailyTask")
    public R<?> dailyTask();
}
