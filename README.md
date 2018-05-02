# linux-system-monitor
    wget https://raw.githubusercontent.com/endto/linux-system-monitor/master/monitor.sh
    chmod +x monitor.sh
## 运行前检查前一个进程是否关闭
    ps -aux | grep monitor.sh
        root     21080  0.0  0.0  12528  2928 pts/1    S    18:01   0:00 bash monitor.sh
        root     21208  0.0  0.0  14220   968 pts/1    S+   18:01   0:00 grep --color=auto monitor.sh
## 关闭已经运行的进程
    kill -9 21080
## 后台运行
    nohup bash monitor.sh > monitor_result.csv &
