package com.ruoyi.spider.domain;

import lombok.Data;
import lombok.Getter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * bilibili用户信息对象 spider_bilibili
 *
 * @author ruoyi
 * @date 2025-01-21
 */
@Data
public class Bilibili extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long userId;

    private String cookie;

    private String refreshToken;

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("cookie", getCookie())
            .append("refreshToken", getRefreshToken())
            .toString();
    }
}
