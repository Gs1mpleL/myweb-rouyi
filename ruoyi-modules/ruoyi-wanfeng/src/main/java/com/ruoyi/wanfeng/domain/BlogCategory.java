package com.ruoyi.wanfeng.domain;

import com.ruoyi.common.core.web.domain.BaseEntity;
import lombok.Data;

@Data
public class BlogCategory extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long categoryId;

    private String categoryName;

    private String delFlag;
}
