package com.ruoyi.wanfeng;

import com.ruoyi.common.security.annotation.EnableCustomConfig;
import com.ruoyi.common.security.annotation.EnableRyFeignClients;
import com.ruoyi.wanfeng.kafka.KafkaProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 自建微服务
 *
 * @author ruoyi
 */
@SpringBootApplication
@EnableCustomConfig
@EnableRyFeignClients
public class RuoYiWanfengApplication implements CommandLineRunner {
    public static void main(String[] args) {
        SpringApplication.run(RuoYiWanfengApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  晚风服务模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }

    @Autowired
    KafkaProducerService kafkaProducerService;
    @Override
    public void run(String... args) throws Exception {
        kafkaProducerService.sendMessage("Hello, Kafka!");
    }
}
