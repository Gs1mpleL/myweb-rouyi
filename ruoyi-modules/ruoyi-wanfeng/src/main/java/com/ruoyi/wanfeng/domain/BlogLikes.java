package com.ruoyi.wanfeng.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlogLikes {
    private Long userId;
    private Long blogId;
    private Integer type;
    private Timestamp likeTime;
    public BlogLikes(Long userId, Long blogId){
        this.userId = userId;
        this.blogId = blogId;
    }
}