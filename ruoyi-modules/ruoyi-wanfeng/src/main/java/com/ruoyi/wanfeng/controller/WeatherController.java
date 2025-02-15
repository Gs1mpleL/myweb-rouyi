package com.ruoyi.wanfeng.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.wanfeng.domain.Weather;
import com.ruoyi.wanfeng.dto.Location;
import com.ruoyi.wanfeng.service.WeatherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/spider")
public class WeatherController {
    @Autowired
    WeatherService weatherService;
    @PostMapping("/weather")
    public R<?> getLocation(@RequestBody Location location){
        Weather curWeather = weatherService.getCurWeather(location);
        return R.ok(curWeather);
    }
}
