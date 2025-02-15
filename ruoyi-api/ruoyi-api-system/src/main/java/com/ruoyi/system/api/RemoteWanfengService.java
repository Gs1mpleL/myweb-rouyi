package com.ruoyi.system.api;

import com.ruoyi.common.core.constant.SecurityConstants;
import com.ruoyi.common.core.constant.ServiceNameConstants;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.system.api.factory.RemoteWanfengFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * 文件服务
 *
 * @author ruoyi
 */
@FeignClient(contextId = "remoteWanfengService", value = ServiceNameConstants.SPIDER_SERVICE, fallbackFactory = RemoteWanfengFallbackFactory.class)
public interface RemoteWanfengService
{
    /**
     * bilibili日常任务
     *
     * @return 结果
     */
    @GetMapping(value = "/spider/bilibili/dailyTask")
    public R<?> dailyTask(@RequestHeader(SecurityConstants.FROM_SOURCE) String source);
}
