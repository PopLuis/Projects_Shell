#!/bin/bash

PRAG_CPU=80
PRAG_MEM=80
PRAG_DISK=90


trimite_alerta(){
	local resursa=$1
	local valoare=$2
	echo -e "\e[31m[ALERTA] $resursa a depasit pragul: $valoare %\e[0m"

}

echo "==============================================="
echo "     MONITORIZARE SISTEM IN TIMP REAL"
echo "     (Apasa Ctrl+C pentru a opri)"
echo "==============================================="

while true; do

	cpu_utilizat=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
	mem_utilizate=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
	disk_utilizat=$(df / | grep / | awk '{print $5}' | sed 's/%//')

	printf "CPU: %5.2f%% | MEM: %5.2f%% | DISK: %s%%\n" "$cpu_utilizat" "$mem_utilizata" "$disk_utilizat"

	if (( $(echo "$cpu_utilizat > $PRAG_CPU" | bc -l))); then
		trimite_alerta "CPU" "$cpu_utilizat"
	fi

	if (( $(echo "$mem_utilizata > $PRAG_MEM" | bc -l) )); then
		trimite_alerta "Memoria" "$mem_utilizata"
	fi

	if  [ "$disk_utilizat" -ggt "$PRAG_DISK" ]; then
		trimite_alarma "Disk" "$disk_utiliat"
	fi
	sleep 3
done 
