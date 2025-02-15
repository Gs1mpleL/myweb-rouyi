package com.ruoyi.wanfeng.domain;

import lombok.Data;

@Data
public class Weather {
    private static final long serialVersionUID = 1L;
    private String textDay;
    private String tempMax;
    private String tempMin;
}
