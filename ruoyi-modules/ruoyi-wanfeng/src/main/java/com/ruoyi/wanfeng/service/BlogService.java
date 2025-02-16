package com.ruoyi.wanfeng.service;

import com.ruoyi.wanfeng.vo.BlogVo;

import java.util.List;

public interface BlogService {
    /**
     * 查询博客列表
     */
    List<BlogVo> listByUserId();

    void add(BlogVo blogVo);

    void update(BlogVo blogVo);

    void del(Long blogId);

    BlogVo selectById(Long blogId);
}
