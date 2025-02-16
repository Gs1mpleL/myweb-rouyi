package com.ruoyi.wanfeng.service.impl;

import com.ruoyi.common.core.context.SecurityContextHolder;
import com.ruoyi.common.core.exception.GlobalException;
import com.ruoyi.wanfeng.domain.Blog;
import com.ruoyi.wanfeng.domain.BlogCategory;
import com.ruoyi.wanfeng.mapper.BlogMapper;
import com.ruoyi.wanfeng.service.BlogService;
import com.ruoyi.wanfeng.vo.BlogVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;

    @Override
    public List<BlogVo> listByUserId() {
        return blogMapper.listByUserId(SecurityContextHolder.getUserId());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(BlogVo blogVo) {
        // 检查标题是否重复
        if (isTitleDuplicate(blogVo.getTitle())) {
            throw new GlobalException("博客标题已存在，请使用其他标题。");
        }
        // 需要新建一个博客分类
        if (blogVo.getCategoryId() == null){
            BlogCategory blogCategory = new BlogCategory();
            blogCategory.setCategoryName(blogVo.getCategoryName());
            blogMapper.addCategory(blogCategory);
            // 分类id已经赋值给了blogCategory
            blogVo.setCategoryId(blogCategory.getId());
        }
        blogVo.setUserId(SecurityContextHolder.getUserId());
        blogMapper.add(blogVo);
    }

    @Override
    public void update(BlogVo blogVo) {
        // 检查标题是否重复
        if (isTitleDuplicate(blogVo.getTitle())) {
            throw new GlobalException("博客标题已存在，请使用其他标题。");
        }
        // 需要新建一个博客分类
        if (blogVo.getCategoryId() == null){
            BlogCategory blogCategory = new BlogCategory();
            blogCategory.setCategoryName(blogVo.getCategoryName());
            blogMapper.addCategory(blogCategory);
            // 分类id已经赋值给了blogCategory
            blogVo.setCategoryId(blogCategory.getId());
        }
        blogMapper.update(blogVo);

    }
    private boolean isTitleDuplicate(String title) {
        // 调用 mapper 方法查询是否存在相同标题的博客
        Integer count = blogMapper.countByTitle(title);
        return count != null && count > 0;
    }

    @Override
    public void del(Long blogId) {
        blogMapper.deleteBlogById(blogId);
    }

    @Override
    public Blog selectById(Long blogId) {
        return blogMapper.selectById(blogId);
    }
}
