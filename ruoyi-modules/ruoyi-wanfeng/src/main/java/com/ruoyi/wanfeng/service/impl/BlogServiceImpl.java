package com.ruoyi.wanfeng.service.impl;

import com.ruoyi.wanfeng.domain.Blog;
import com.ruoyi.wanfeng.domain.BlogCategory;
import com.ruoyi.wanfeng.mapper.BlogMapper;
import com.ruoyi.wanfeng.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;

    @Override
    public List<Blog> selectBlogList() {
        return blogMapper.getBlogList();
    }

    @Override
    public void add(Blog blog) {
        if (blog.getCategoryId()==null){
            BlogCategory blogCategory = new BlogCategory();
            blogCategory.setCategoryName(blog.getCategoryName());
            blogMapper.addCategory(blogCategory);
            Long categoryId = blogCategory.getCategoryId();
            blog.setCategoryId(categoryId);
            blogMapper.add(blog);
        }
        else {
            blogMapper.add(blog);
        }
    }

    @Override
    public void update(Blog blog) {
        blogMapper.update(blog);
    }

    @Override
    public void del(Long blogId) {
        blogMapper.deleteBlogById(blogId);
    }
}
