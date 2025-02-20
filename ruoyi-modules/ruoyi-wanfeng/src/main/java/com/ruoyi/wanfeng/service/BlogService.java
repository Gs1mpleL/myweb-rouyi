package com.ruoyi.wanfeng.service;

import com.ruoyi.wanfeng.domain.BlogComments;
import com.ruoyi.wanfeng.domain.BlogLikes;
import com.ruoyi.wanfeng.vo.BlogVo;

import java.util.List;

public interface BlogService {
    /**
     * 查询博客列表
     */
    List<BlogVo> listByUserId();

    void add(BlogVo blogVo);

    void update(BlogVo blogVo);

    void delBlog(Long blogId);

    BlogVo selectBlogById(Long blogId);

    /**
     * 用户点赞博客
     * @param blogLikes 点赞实体类，包含用户 ID 和博客 ID 等信息
     * @return 点赞是否成功
     */
    boolean likeBlog(BlogLikes blogLikes);



    /**
     * 用户发表评论
     * @param blogComments 评论实体类，包含用户 ID、博客 ID、评论内容等信息
     * @return 发表评论是否成功
     */
    boolean addComment(BlogComments blogComments);

    /**
     * 用户删除评论
     * @param blogComments 评论实体类，包含用户 ID 和博客 ID 等信息
     * @return 删除评论是否成功
     */
    boolean deleteComment(BlogComments blogComments);

    /**
     * 检查用户是否对某博客发表过评论
     * @param blogComments 评论实体类，包含用户 ID 和博客 ID 等信息
     * @return 是否发表过评论
     */
    boolean hasUserCommented(BlogComments blogComments);
}
