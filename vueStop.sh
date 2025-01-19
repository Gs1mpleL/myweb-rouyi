#!/bin/bash

# 使用 ps 和 grep 找到所有 node 进程的 PID
pids=$(ps -ef | grep node | grep -v grep | awk '{print $2}')

# 检查是否找到了 node 进程的 PID
if [ -n "$pids" ]; then
    # 遍历每个 PID 并关闭进程
    for pid in $pids
    do
        echo "Killing node process with PID $pid"
        kill $pid
        # 你可以添加一些等待和检查逻辑，以确保进程被成功关闭
         sleep 1
         if ps -p $pid > /dev/null; then
             echo "Process with PID $pid did not shut down gracefully, using kill -9"
             kill -9 $pid
         fi
    done
else
    echo "No node processes found"
fi
