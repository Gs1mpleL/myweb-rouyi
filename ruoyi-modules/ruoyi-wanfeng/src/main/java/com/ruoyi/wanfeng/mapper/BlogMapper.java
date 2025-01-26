package com.ruoyi.wanfeng.mapper;

import com.ruoyi.wanfeng.domain.Blog;
import com.ruoyi.wanfeng.domain.BlogCategory;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BlogMapper {
    List<Blog> getBlogList();
    void add(Blog blog);
    void update(Blog blog);
    void deleteBlogById(Long id);
    Long addCategory(BlogCategory blogCategory);
}
