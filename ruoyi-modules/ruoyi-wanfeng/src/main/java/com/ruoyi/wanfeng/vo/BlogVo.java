package com.ruoyi.wanfeng.vo;

import com.ruoyi.common.core.web.domain.BaseEntity;
import lombok.Data;

@Data
public class BlogVo extends BaseEntity {
    private static final long serialVersionUID = 1L;
    private Long blogId;
    private Long userId;
    private Long categoryId;
    private String title;
    private String content;
    private String categoryName;
    private String author;
}
