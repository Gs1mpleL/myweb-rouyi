package com.ruoyi.wanfeng.service.impl;

import com.github.benmanes.caffeine.cache.Cache;
import com.ruoyi.common.core.constant.CacheConstants;
import com.ruoyi.common.core.context.SecurityContextHolder;
import com.ruoyi.common.core.exception.GlobalException;
import com.ruoyi.common.redis.service.RedisService;
import com.ruoyi.wanfeng.domain.BlogCategory;
import com.ruoyi.wanfeng.domain.BlogComments;
import com.ruoyi.wanfeng.domain.BlogLikes;
import com.ruoyi.wanfeng.mapper.BlogMapper;
import com.ruoyi.wanfeng.service.BlogService;
import com.ruoyi.wanfeng.vo.BlogVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;

import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;

@Service
@Slf4j
public class BlogServiceImpl implements BlogService {
    public static final String LIKE_RECORD_CACHE = CacheConstants.WANFENG_BLOG_KEY + ":likeRecord:";
    public static final String LIKE_COUNT_CACHE = CacheConstants.WANFENG_BLOG_KEY + ":likeRecord:";
    public static final String TOPIC_BLOG_LIKE = "blog-like";
    @Autowired
    private BlogMapper blogMapper;
    @Autowired
    private KafkaTemplate<Object, BlogLikes> kafkaTemplate;
    @Autowired
    private RedisService redisService;
    @Autowired
    @Qualifier("BlogLikeLocalCache")
    private Cache<String, Object> blogLikeLocalCache;
    @Override
    public List<BlogVo> listByUserId() {
        return blogMapper.listByUserId();
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
        if (!Objects.equals(blogVo.getUserId(), SecurityContextHolder.getUserId())){
            throw new GlobalException("您没有权限修改该博客。");
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
    public void delBlog(Long blogId) {
        BlogVo blog = blogMapper.selectById(blogId);
        if (!Objects.equals(blog.getUserId(), SecurityContextHolder.getUserId())){
            throw new GlobalException("您没有权限删除该博客。");
        }
        blogMapper.deleteBlogById(blogId);
    }

    @Override
    public BlogVo selectBlogById(Long blogId) {
        BlogVo blogVo = blogMapper.selectById(blogId);
        Long likeCountCache = (Long) blogLikeLocalCache.getIfPresent(LIKE_COUNT_CACHE + ":" + blogVo.getBlogId());
        if (likeCountCache == null){
            blogLikeLocalCache.put(LIKE_COUNT_CACHE + ":" + blogVo.getBlogId(), blogVo.getLikeCount());
        }else {
            blogVo.setLikeCount(likeCountCache);
            // 缓存数据过多，写回数据库
            if (likeCountCache - blogVo.getLikeCount() > 0){
                blogVo.setLikeCount(likeCountCache);
                blogMapper.update(blogVo);
            }
        }
        Long userId = SecurityContextHolder.getUserId();
        boolean like = false;
        BlogLikes latestLikeRecord = blogMapper.getLatestLikeRecord(new BlogLikes(userId, blogId));
        if (latestLikeRecord!=null &&(Objects.equals(latestLikeRecord.getType(), 1))){
            like = true;
        }
        blogVo.setLike(like);
        return blogVo;
    }

    @Override
    public boolean likeBlog(BlogLikes blogLikes) {
        // 发送消息设置key，保证消息发到同一个分区，保证同一个用户的服务顺序
        ListenableFuture<SendResult<Object, BlogLikes>> future = kafkaTemplate.send(TOPIC_BLOG_LIKE, blogLikes);

        future.addCallback(new ListenableFutureCallback<SendResult<Object, BlogLikes>>() {
            @Override
            public void onFailure(Throwable ex) {
                log.error("消息发送失败: {}", ex.getMessage());
                // 可以将失败的消息记录到数据库
                // 这里对发送失败的消息进行处理，就不写了
            }
            @Override
            public void onSuccess(SendResult<Object, BlogLikes> result) {
                log.info("消息发送成功: {}", result.getRecordMetadata().toString());
            }
        });
        return true;
    }


    @KafkaListener(topics = TOPIC_BLOG_LIKE, groupId = "likeConsumer")
    public void listenLike(BlogLikes blogLikes) {
        log.info("准备消费信息{}",blogLikes);
        /******************************************************去重********************************************************/
        // 本地缓存去重
        Integer localCacheType = (Integer) blogLikeLocalCache.getIfPresent(LIKE_RECORD_CACHE + ":" + blogLikes.getUserId()+":"+ blogLikes.getBlogId());
        if (localCacheType != null && Objects.equals(localCacheType, blogLikes.getType())) {
            log.info("{},hit local cache", blogLikes);
            return;
        }
        // redis缓存去重
        Integer redisCacheType = redisService.getCacheObject(LIKE_RECORD_CACHE + ":" + blogLikes.getUserId() + ":" + blogLikes.getBlogId());
        if (redisCacheType != null && Objects.equals(redisCacheType, blogLikes.getType())){
            log.info("{},hit redis cache", blogLikes);
            return;
        }
        // 数据库去重
        BlogLikes latestLikeRecord = blogMapper.getLatestLikeRecord(blogLikes);
        if (latestLikeRecord!=null){
            // 数据已经存入数据库
            // 直接刷新缓存
            blogLikeLocalCache.put(LIKE_RECORD_CACHE + ":" + blogLikes.getUserId() + ":" + blogLikes.getBlogId(), latestLikeRecord.getType());
            redisService.setCacheObject(LIKE_RECORD_CACHE + ":" + blogLikes.getUserId() + ":" + blogLikes.getBlogId(), latestLikeRecord.getType());;
            // 已有数据与当前操作数据重复
            if (Objects.equals(latestLikeRecord.getType(), blogLikes.getType())){
                log.info("{},hit db", blogLikes);
                return;
            }
        }else {
            // 没数据说明没点赞过
            if (blogLikes.getType() == 2){
                // 没点过赞 不能取消点赞
                log.info("{},null hit db 未点赞不能取消点赞", blogLikes);
                return;
            }
        }
        /******************************************************去重结束********************************************************/

        /*****************************************************插入数据库********************************************************/
        // 存入数据库
        blogMapper.insertLike(blogLikes);
        // 记录缓存
        blogLikeLocalCache.put(LIKE_RECORD_CACHE + ":" + blogLikes.getUserId()+":"+ blogLikes.getBlogId(), blogLikes.getType());
        redisService.setCacheObject(LIKE_RECORD_CACHE + ":" + blogLikes.getUserId()+":"+ blogLikes.getBlogId(), blogLikes.getType());
        Long likeLocalCacheCount = (Long) blogLikeLocalCache.getIfPresent(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId());
        if (likeLocalCacheCount == null){
            blogLikeLocalCache.put(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId(), blogMapper.selectById(blogLikes.getBlogId()).getLikeCount() + blogLikes.getType() == 1 ? 1L : -1L);
        }else {
            blogLikeLocalCache.put(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId(), likeLocalCacheCount + blogLikes.getType() == 1 ?1L : -1L);
        }
        // 文章点赞数缓存更新
        if (!redisService.hasKey(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId())){
            redisService.setCacheObject(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId(), blogMapper.selectById(blogLikes.getBlogId()).getLikeCount() + blogLikes.getType() == 1 ? 1L : -1L);
        }
        else {
            redisService.increment(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId(), blogLikes.getType() == 1 ? 1L : -1L);
        }
    }




    @Override
    public boolean addComment(BlogComments blogComments) {
        blogComments.setUserId(SecurityContextHolder.getUserId());
        if (blogComments.getCommentContent() == null || blogComments.getCommentContent().isEmpty()) {
            return false;
        }
        blogComments.setCommentTime(new Timestamp(System.currentTimeMillis()));
        int result = blogMapper.insertComment(blogComments);
        return result > 0;
    }

    @Override
    public boolean deleteComment(BlogComments blogComments) {
        blogComments.setUserId(SecurityContextHolder.getUserId());
        int result = blogMapper.deleteComment(blogComments);
        return result > 0;
    }

    @Override
    public boolean hasUserCommented(BlogComments blogComments) {
        blogComments.setUserId(SecurityContextHolder.getUserId());
        return blogMapper.selectCommentCount(blogComments) > 0;
    }
}
