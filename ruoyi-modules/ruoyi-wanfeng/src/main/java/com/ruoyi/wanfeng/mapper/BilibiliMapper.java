package com.ruoyi.wanfeng.mapper;

import com.ruoyi.wanfeng.domain.Bilibili;

import java.util.List;

/**
 * bilibili用户信息Mapper接口
 *
 * @author ruoyi
 */
public interface BilibiliMapper {
    public int insertOrUpdateBilibiliByUserId(Bilibili bilibili);

    public int updateBilibili(Bilibili bilibili);

    public Bilibili getBilibiliByUserId(Long userId);

    public List<Bilibili> getBilibilis();
}
