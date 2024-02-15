#!/bin/bash
#This is for a Linux OS
arch=$(uname -a)
cpu=$(grep "physical id" /proc/cpuinfo | wc -l)
vcpu=$(grep "processor" /proc/cpuinfo | wc -l)
mem1=$(free -h | awk 'NR==2{print $3}')
mem2=$(free -h | awk 'NR==2{print $2}')
mem3=$(free -h | awk 'NR==2{ printf "%.2f", ($3 / $2) * 100 }')
disk1=$(df -h --total | awk 'NR==14{print $3}')
disk2=$(df -h --total | awk 'NR==14{print $2}')
disk3=$(df -h --total | awk 'NR==14{print $5}')
load=$(mpstat | awk 'NR==4{print 100 - $13}')
last_boot=$(who -b | awk '{print $3" "$4}')
lvm=$(lsblk | grep lvm | awk '{if ($1) print "Yes";exit}')
tcp_conns=$(netstat | grep "ESTABLISHED" | wc -l)
user_log=$(who | wc -l)
ip=$(hostname -I)
mac=$(ip a | awk 'NR==8{print $2}')
sudos=$(journalctl -q _COMM=sudo | grep COMMAND | wc -l)

message="
===============================================================================
#Architecture: $arch
#CPU physical : $cpu
#vCPU : $vcpu
#Memory Usage: $mem1/$mem2 ($mem3%)
#Disk Usage: $disk1/$disk2 ($disk3)
#CPU load: $load%
#Last boot: $last_boot
#LVM use: $lvm
#Connections TCP : $tcp_conns ESTABLISHED
#User log: $user_log
#Network: $ip($mac)
#Sudo : $sudos
===============================================================================
"

echo "$message" | wall

