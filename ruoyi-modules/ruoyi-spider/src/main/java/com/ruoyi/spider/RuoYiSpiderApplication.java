package com.ruoyi.spider;

import com.ruoyi.common.security.annotation.EnableCustomConfig;
import com.ruoyi.common.security.annotation.EnableRyFeignClients;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 文件服务
 *
 * @author ruoyi
 */
@SpringBootApplication()
@EnableCustomConfig
@EnableRyFeignClients
public class RuoYiSpiderApplication {
    public static void main(String[] args) {
        SpringApplication.run(RuoYiSpiderApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  爬虫服务模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
