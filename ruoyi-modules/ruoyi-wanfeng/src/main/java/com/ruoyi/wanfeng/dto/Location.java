package com.ruoyi.wanfeng.dto;

import lombok.Data;

@Data
public class Location {
    private Double jingdu;
    private Double weidu;

    // 重写 toString 方法
    @Override
    public String toString() {
        // 使用 String.format 格式化经度和纬度，保留两位小数
        return String.format("%.2f,%.2f", jingdu, weidu);
    }
}
