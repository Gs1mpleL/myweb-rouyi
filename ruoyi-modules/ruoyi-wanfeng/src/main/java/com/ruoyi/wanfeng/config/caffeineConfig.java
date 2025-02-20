package com.ruoyi.wanfeng.config;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class caffeineConfig {
    @Bean("BlogLikeLocalCache")
    public Cache<String, Object> caffeineCacheConfig() {
        Cache<String, Object> cache = Caffeine.newBuilder()
                // 初始容量
                .initialCapacity(100)
                // 最大缓存数量
                .maximumSize(500)
                // 缓存过期时间：写入缓存后，经过某个时间缓存失效
//                .expireAfterWrite(3, TimeUnit.MINUTES)
                // 缓存失效监听器
                .removalListener((key, value, cause) -> log.info("key:{} value:{} cause:{} 缓存过期", key, value, cause))
                .evictionListener((key, value, cause) -> log.info("key:{} value:{} cause:{} 缓存被移除", key, value, cause))
                // 开启统计功能
                .recordStats()
                .build();
        return cache;
    }
}
