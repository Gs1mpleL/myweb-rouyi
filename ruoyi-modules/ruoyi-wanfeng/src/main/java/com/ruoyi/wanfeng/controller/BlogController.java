package com.ruoyi.wanfeng.controller;

import com.ruoyi.common.core.context.SecurityContextHolder;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.wanfeng.domain.BlogComments;
import com.ruoyi.wanfeng.domain.BlogLikes;
import com.ruoyi.wanfeng.service.BlogService;
import com.ruoyi.wanfeng.vo.BlogVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;

@RestController
@RequestMapping("/learn/blog")
public class BlogController {
    @Autowired
    private BlogService blogService;

    @GetMapping("/list")
    public R<?> list() {
        List<BlogVo> list = blogService.listByUserId();
        return R.ok(list);
    }

    @PostMapping
    public R<?> add(@RequestBody BlogVo blogVo) {
        blogService.add(blogVo);
        return R.ok();
    }

    @PutMapping
    public R<?> update(@RequestBody BlogVo blog) {
        blogService.update(blog);
        return R.ok(blog);
    }

    @DeleteMapping("/{blogId}")
    public R<?> del(@PathVariable Long blogId) {
        blogService.delBlog(blogId);
        return R.ok(blogId);
    }

    @GetMapping("/{blogId}")
    public R<?> selectById(@PathVariable Long blogId) {
        BlogVo blog = blogService.selectBlogById(blogId);
        return R.ok(blog);
    }

    // 点赞博客
    @PostMapping("/like")
    public R<?> likeBlog(@RequestBody BlogLikes blogLikes) {
        blogLikes.setUserId(SecurityContextHolder.getUserId());
        blogLikes.setLikeTime(new Timestamp(System.currentTimeMillis()));
        return R.ok(blogService.likeBlog(blogLikes));
    }


    // 添加评论
    @PostMapping("/comment")
    public R<?> addComment(@RequestBody BlogComments blogComments) {
        boolean result = blogService.addComment(blogComments);
        return R.ok(result);
    }

    // 删除评论
    @PostMapping("/delete-comment")
    public R<?> deleteComment(@RequestBody BlogComments blogComments) {
        boolean result = blogService.deleteComment(blogComments);
        return R.ok(result);
    }

    // 检查用户是否对某博客发表过评论
    @PostMapping("/has-commented")
    public R<?> hasUserCommented(@RequestBody BlogComments blogComments) {
        boolean result = blogService.hasUserCommented(blogComments);
        return R.ok(result);
    }
}
