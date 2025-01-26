package com.ruoyi.wanfeng.domain;

import com.ruoyi.common.core.web.domain.BaseEntity;
import lombok.Data;

@Data
public class Blog extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long blogId;

    private String title;

    private String content;

    private Long categoryId;
    private String categoryName;

    private String author;

    private String delFlag;
}
