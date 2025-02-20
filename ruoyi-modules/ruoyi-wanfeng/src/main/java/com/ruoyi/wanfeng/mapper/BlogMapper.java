package com.ruoyi.wanfeng.mapper;

import com.ruoyi.wanfeng.domain.BlogCategory;
import com.ruoyi.wanfeng.domain.BlogComments;
import com.ruoyi.wanfeng.domain.BlogLikes;
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
    BlogVo selectById(Long blogId);
    /**
     * 插入点赞记录
     * @param blogLikes 点赞记录实体
     * @return 插入成功的记录数
     */
    Integer insertLike(BlogLikes blogLikes);

    /**
     * 查询用户对某博客的点赞记录数
     * @param blogLikes 点赞记录实体，包含用户 ID 和博客 ID
     * @return 点赞记录数
     */
    Integer getLikeType(BlogLikes blogLikes);

    /**
     * 判断数据库最新记录是否与插入数据type类型相同
     */
    BlogLikes getLatestLikeRecord(BlogLikes blogLikes);

    /**
     * 插入评论记录
     * @param blogComments 评论记录实体
     * @return 插入成功的记录数
     */
    int insertComment(BlogComments blogComments);

    /**
     * 删除评论记录
     * @param blogComments 评论记录实体，包含用户 ID 和博客 ID
     * @return 删除成功的记录数
     */
    int deleteComment(BlogComments blogComments);

    /**
     * 查询用户对某博客的评论记录数
     * @param blogComments 评论记录实体，包含用户 ID 和博客 ID
     * @return 评论记录数
     */
    int selectCommentCount(BlogComments blogComments);
}
