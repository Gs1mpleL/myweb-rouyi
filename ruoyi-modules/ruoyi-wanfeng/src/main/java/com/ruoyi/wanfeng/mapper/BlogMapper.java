package com.ruoyi.wanfeng.mapper;

import com.ruoyi.wanfeng.domain.Blog;
import com.ruoyi.wanfeng.domain.BlogCategory;
import com.ruoyi.wanfeng.vo.BlogVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BlogMapper {
    List<BlogVo> listByUserId();
    void add(BlogVo blogVo);
    void update(BlogVo blogVo);
    void deleteBlogById(Long id);
    void addCategory(BlogCategory blogCategory);
    Integer countByTitle(String title);
    Blog selectById(Long blogId);
}
