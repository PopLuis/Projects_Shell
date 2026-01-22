#!/bin/zsh

cpu_num=$(grep -c "processor" /proc/cpuinfo)

mem_total=$(free -g | grep "Mem:" | awk '{print $2}')

mem_free=$(free -m | grep "Mem:" | awk '{print $4}')

disk_size=$(df -h / | grep "/" | awk '{print $2}')

system_bit=$(getconf LONG_BIT)

process_count=$(ps -ef | wc -l)

software_num=$(dpkg-query -l | grep "^ii" | wc -l)

ip_address=$(ip addr | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d/ -f1 | head -n 1)

echo "cpu num: $cpu_num"
echo "memory total: $mem_total G"
echo "memory free: $mem_free M"
echo "disk size: $disk_size"
echo "system bit: $system_bit"
echo "process: $process_count"
echo "software num: $software_num"
echo "ip: $ip_address"
