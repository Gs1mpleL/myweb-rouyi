package com.ruoyi.wanfeng.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.wanfeng.domain.Blog;
import com.ruoyi.wanfeng.service.BlogService;
import com.ruoyi.wanfeng.vo.BlogVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
        blogService.del(blogId);
        return R.ok(blogId);
    }

    @GetMapping("/{blogId}")
    public R<?> selectById(@PathVariable Long blogId) {
        Blog blog = blogService.selectById(blogId);
        return R.ok(blog);
    }
}
