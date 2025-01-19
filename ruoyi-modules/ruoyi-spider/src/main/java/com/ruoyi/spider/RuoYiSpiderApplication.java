package com.ruoyi.spider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 文件服务
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class RuoYiSpiderApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(RuoYiSpiderApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  爬虫服务模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
