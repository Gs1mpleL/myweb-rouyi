#!/bin/bash

# 启动 MySQL
docker-compose up -d ruoyi-mysql
if [ $? -ne 0 ]; then
    echo "MySQL 启动失败，停止后续操作。"
    exit 1
fi

# 启动 Redis
docker-compose up -d ruoyi-redis
if [ $? -ne 0 ]; then
    echo "Redis 启动失败，停止后续操作。"
    exit 1
fi
echo "Redis mysql 已启动，等待 3 秒..."
sleep 3

# 启动 Nacos
docker-compose up -d ruoyi-nacos
if [ $? -ne 0 ]; then
    echo "Nacos 启动失败，停止后续操作。"
    exit 1
fi
echo "Nacos 已启动，等待 3 秒..."
sleep 3

# 启动 Gateway
docker-compose up -d ruoyi-gateway
if [ $? -ne 0 ]; then
    echo "Gateway 启动失败，停止后续操作。"
    exit 1
fi
echo "Gateway 已启动，等待 3 秒..."
sleep 3

# 启动 Nginx
docker-compose up -d ruoyi-nginx
if [ $? -ne 0 ]; then
    echo "Nginx 启动失败，停止后续操作。"
    exit 1
fi
echo "Nginx 已启动，等待 3 秒..."
sleep 3

# 启动其他所有服务
docker-compose up -d ruoyi-auth ruoyi-modules-system ruoyi-modules-wanfeng ruoyi-modules-gen ruoyi-modules-job ruoyi-modules-file ruoyi-visual-monitor sentinel-dashboard
if [ $? -ne 0 ]; then
    echo "其他服务启动失败。"
    exit 1
fi
echo "所有服务已成功启动。"