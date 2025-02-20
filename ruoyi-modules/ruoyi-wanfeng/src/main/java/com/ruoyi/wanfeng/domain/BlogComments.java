package com.ruoyi.wanfeng.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BlogComments {
    private Long userId;
    private Long blogId;
    private String commentContent;
    private Timestamp commentTime;
}