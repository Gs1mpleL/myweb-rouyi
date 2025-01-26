package com.ruoyi.wanfeng;

import com.ruoyi.common.security.annotation.EnableCustomConfig;
import com.ruoyi.common.security.annotation.EnableRyFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 文件服务
 *
 * @author ruoyi
 */
@SpringBootApplication
@EnableCustomConfig
@EnableRyFeignClients
public class RuoYiWanfengApplication {
    public static void main(String[] args) {
        SpringApplication.run(RuoYiWanfengApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  晚风服务模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
