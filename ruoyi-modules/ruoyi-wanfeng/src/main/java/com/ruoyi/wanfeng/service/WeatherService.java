package com.ruoyi.wanfeng.service;

import com.ruoyi.wanfeng.domain.Weather;
import com.ruoyi.wanfeng.dto.Location;

public interface WeatherService {
    Weather getCurWeather(Location location);
}
