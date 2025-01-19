#!/bin/bash

# 定义要关闭的端口列表
ports=(9200 9300 8080 9202 9203 9100 9201)

# 遍历端口列表
for port in "${ports[@]}"
do
    # 使用 lsof 命令查找在该端口上运行的进程的 PID
    pid=$(lsof -t -i :$port)
    if [ -n "$pid" ]; then
        # 如果找到了 PID，则使用 kill 命令关闭该进程
        echo "Closing process on port $port with PID $pid"
        kill $pid
        # 可以添加更多逻辑，例如等待一段时间后检查进程是否已经关闭，或者使用 kill -9 强制关闭
        # sleep 5
        # if ps -p $pid > /dev/null; then
        #     echo "Process on port $port did not shut down gracefully, using kill -9"
        #     kill -9 $pid
        # fi
    else
        echo "No process found on port $port"
    fi
done
