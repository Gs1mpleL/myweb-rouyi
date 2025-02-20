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
    public static final String LIKE_RECORD_CACHE = CacheConstants.WANFENG_BLOG_KEY + ":likeRecord";
    public static final String LIKE_COUNT_CACHE = CacheConstants.WANFENG_BLOG_KEY + ":likeCount";
    public static final String BLOG_CACHE = CacheConstants.WANFENG_BLOG_KEY;
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
        redisService.deleteObject(BLOG_CACHE + ":" + blogVo.getBlogId());
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
        BlogVo blogVo = redisService.getCacheObject(BLOG_CACHE + ":" + blogId);
        if (blogVo == null){
            blogVo = blogMapper.selectById(blogId);
            blogVo.setLikeCount(0);  // 点赞数另外缓存
            redisService.setCacheObject(BLOG_CACHE, blogVo);
        }
        Integer likeCountCache = redisService.getCacheObject(LIKE_COUNT_CACHE + ":" + blogVo.getBlogId());
        if (likeCountCache == null){
            redisService.setCacheObject(LIKE_COUNT_CACHE + ":" + blogVo.getBlogId(), blogVo.getLikeCount());
        }else {
            blogVo.setLikeCount(likeCountCache);
            // 缓存数据过多，写回数据库(缓存回写交给定时任务) 写回后删除缓存，对于不再是热点的id，缓存2天，每天写回
//            if (likeCountCache - blogVo.getLikeCount() > 100){
//                blogVo.setLikeCount(likeCountCache);
//                blogMapper.update(blogVo);
//            }
            // dev 直接写回
            blogMapper.update(blogVo);
        }
        Long userId = SecurityContextHolder.getUserId();
        // 用户是否点赞
        Integer likeTypeCache = redisService.getCacheObject(LIKE_RECORD_CACHE + ":" + blogId + ":" + userId);
        if (likeTypeCache==null){
            BlogLikes latestLikeRecord = blogMapper.getLatestLikeRecord(new BlogLikes(userId, blogId));
            if (latestLikeRecord==null){
                blogVo.setLike(false);
                redisService.setCacheObject(LIKE_RECORD_CACHE + ":" + blogId + ":" + userId, 2);
            } else {
                blogVo.setLike(latestLikeRecord.getType()==1);
                redisService.setCacheObject(LIKE_RECORD_CACHE + ":" + blogId + ":" + userId, latestLikeRecord.getType());
            }
        }else {
            blogVo.setLike(likeTypeCache==1);
        }
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

    @Transactional(rollbackFor = Exception.class)
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
            blogLikeLocalCache.put(LIKE_RECORD_CACHE + ":" + blogLikes.getBlogId() + ":" + blogLikes.getUserId(), latestLikeRecord.getType());
            redisService.setCacheObject(LIKE_RECORD_CACHE + ":" + blogLikes.getBlogId() + ":" + blogLikes.getUserId(), latestLikeRecord.getType());;
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
        log.info("{},insert db", blogLikes);
        // 记录缓存
        blogLikeLocalCache.put(LIKE_RECORD_CACHE + ":" + blogLikes.getBlogId()+":"+ blogLikes.getUserId(), blogLikes.getType());
        log.info("{},insert localCache", blogLikes);
        redisService.setCacheObject(LIKE_RECORD_CACHE + ":" + blogLikes.getBlogId()+":"+ blogLikes.getUserId(), blogLikes.getType());
        log.info("{},insert redisCache", blogLikes);
        // 缓存点赞数+1或-1 不适合本地缓存使用
        // 文章点赞数缓存更新
        // TODO：Redis集群情况这里需要LUA脚本实现
        if (!redisService.hasKey(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId())){
            redisService.setCacheObject(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId(), blogMapper.selectById(blogLikes.getBlogId()).getLikeCount() + (blogLikes.getType() == 1 ? 1L : -1L));
        }
        else {
            redisService.increment(LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId(), blogLikes.getType() == 1 ? 1L : -1L);
        }
        // 定义 Lua 脚本
        // 定义修改后的 Lua 脚本
//        try {
//            log.info("开始执行lua脚本添加点赞数");
//            String luaScript = "-- 获取传入的键\n" +
//                    "local key = KEYS[1]\n" +
//                    "-- 获取传入的类型参数\n" +
//                    "local type = 1\n" +
//                    "-- 检查键是否存在\n" +
//                    "if redis.call('EXISTS', key) == 0 then\n" +
//                    "    -- 若键不存在，返回 0\n" +
//                    "    return \"0\"\n" +
//                    "else\n" +
//                    "    if type == \"1\" then\n" +
//                    "        -- 若类型为 1，对键的值加 1\n" +
//                    "        return redis.call('INCR', key)\n" +
//                    "    else\n" +
//                    "        -- 若类型不为 1，对键的值减 1\n" +
//                    "        return redis.call('DECR', key)\n" +
//                    "    end\n" +
//                    "  return \"1\"\n" +
//                    "end";
//            // 准备参数
//            String cacheKey = LIKE_COUNT_CACHE + ":" + blogLikes.getBlogId();
//            String type = String.valueOf(blogLikes.getType());
//            List<String> keys = Collections.singletonList(cacheKey);
//            List<String> args = Collections.singletonList(type);
//            // 执行 Lua 脚本
//            String  l = redisService.executeLuaScript(luaScript, String.class, keys, args);
//            log.info("{}：lua执行结果", l);
//            if (Objects.equals(l, "0")) {
//                // 没有点开文章就点赞了，非法操作，在事务中应该直接回滚数据库的操作
//                BlogVo blogVo = blogMapper.selectById(blogLikes.getBlogId());
//                int likeCount = blogVo.getLikeCount();
//                blogVo.setLikeCount(likeCount + blogLikes.getType() == 1 ? 1 : -1);
//                blogMapper.update(blogVo);
//                throw new GlobalException("非法操作");
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//            log.error("lua执行异常", e);
//            throw new GlobalException("lua执行异常");
//        }
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
