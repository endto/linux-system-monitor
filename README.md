# linux-system-monitor
  $ wget https://github.com/endto/linux-system-monitor/blob/master/monitor.sh
  $ chmod +x monitor.sh
## 运行前检查前一个进程是否关闭
  $ ps -aux | grep ‘monitor.sh’
  $ kill -p PID
## 后台运行
  $ nohup bash monitor.sh &
