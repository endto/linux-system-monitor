#! /bin/bash
printf "Date\t\tMemory\t\tDisk\t\tCPU\t\tGPU\t\tGPU Memory\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
Date=$(date -d today +"%Y-%m-%d %T" | awk '{printf "%s%s\t\t", $1, $2}')
MEMORY=$(free -m | awk 'NR==2{printf "%.2f\t\t", $3/1024 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t", $(NF-2)}')
GPU=$(nvidia-smi --query-gpu=utilization.gpu --format=csv | awk 'NR==2{printf "%s%s\t\t", $1, $2}')
GPU_MEM=$(nvidia-smi --query-gpu=memory.used --format=csv | awk 'NR==2{printf "%.2f\t\t", $1/1024}')
echo "$Date$MEMORY$DISK$CPU$GPU$GPU_MEM"
sleep 1
done
