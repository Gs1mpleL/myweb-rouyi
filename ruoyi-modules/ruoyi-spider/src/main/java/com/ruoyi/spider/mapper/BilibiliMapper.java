package com.ruoyi.spider.mapper;

import com.ruoyi.spider.domain.Bilibili;

/**
 * bilibili用户信息Mapper接口
 *
 * @author ruoyi
 * @date 2025-01-21
 */
public interface BilibiliMapper
{
    public int insertOrUpdateBilibiliByUserId(Bilibili bilibili);

    public int updateBilibili(Bilibili bilibili);
    public Bilibili getBilibiliByUserId(Long userId);
}
