package com.ruoyi.wanfeng.service;

import com.ruoyi.wanfeng.domain.Blog;

import java.util.List;

public interface BlogService {
    /**
     * 查询博客列表
     */
    List<Blog> selectBlogList();

    void add(Blog blog);

    void update(Blog blog);

    void del(Long blogId);
}
