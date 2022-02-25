#!/bin/bash
echo "Broadcast message from .... (user@server) (???tty???) (date):"

echo -n "#Architecture: "
uname -a;
echo "#CPU physical : $(lscpu | grep Socket | grep -oe '\([0-9.]*\)')"
echo "#vCPU : $(nproc)"
used_memory=$(free -m | grep Mem: | grep -o '\([0-9]*\)' | sed -n 2p)
total_memory=$(free -m | grep Mem: | grep -o '\([0-9]*\)' | sed -n 1p)
#echo "$available_memory"
#memory_percentage=$(used_memory + 0 / 0 + total_memory * 100)
echo -n "#Memory Usage: $used_memory/${total_memory}MB ("
#echo -n "MB ("
echo $used_memory $total_memory | awk '{printf "%.2f", $1 / $2 * 100}'
echo "%)"
used_space=$(df -BM | grep root | grep -o '\([0-9]*\)' | sed -n 2p)
total_space=$(df -BG | grep root | grep -o '\([0-9]*\)' | sed -n 1p)
space_perc=$(df -BM | grep root | grep -o '\([0-9]*%\)')
echo "#Disk Usage: $used_space/${total_space}Gb ($space_perc)"
load=$(top -n 1 -b | sed -n '8,$'p | cut -c -54 | cut -c 51- | awk 'BEGIN { sum=0 } { sum+=$1 } END {print>
echo "#CPU load: ${load}%"
last_boot=$(who -b | tail -c 17)
echo "#Last boot: $last_boot"
echo -n "#LVM use: "
if grep -q mapper /etc/fstab
        then
                echo 1
        else
                echo 0
fi
conn=$(ss -s | grep -o 'estab [0-9]*' | sed -E "s/^estab //")
echo "#Connexions TCP : $conn ESTABLISHED"
echo -n "#User log: "
who | wc -l
server_ip=$(ip a | grep inet | grep global | sed -E "s/    inet //" | sed -E "s/\/(.)*//")
server_mac=$(ip a | grep link/ether | sed -E "s/    link\/ether //" | head -c 17)
echo "#Network: IP $server_ip ($server_mac)"
echo -n "#Sudo : "
num_comms=$(cat /var/log/sudo/sudo_logs | grep "COMMAND" | wc -l)
echo "$num_comms cmd"
