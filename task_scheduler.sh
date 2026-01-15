#!/bin/bash

list_tasks(){
	echo -e "\n--- Sarcini programate curent ---"
	if crontab -l &>/dev/null; then 
		crontab -l
	else 
		echo "NU exista task-uri programate."
	fi
	echo -r "----------------------------------\n"

}
add_task(){
	echo -e "\n--- Adauga Task Nou ---"
	read -p "Introdu calea completa a comenzii: " cmd
	echo "Alege frecventa (format cron):"
	echo "Exemple:"
	echo " 0 * * * * (In fiecare ora)"
	echo " 0 0 * * * (Zilnic la miezul noptii)"
	echo " 0 0 * * 0 (In fiecare duminica)"
	read -p "Introdu formatul cron: " schedule

	(crontab -l 2>/dev/null; echo "$schedule $cmd") | crontab -
	echo "Succes: Task-ul a fost adaugat!"
}

remove_tasks(){
 	read -p "Esti sigur ca vrei sa stargi toate task-urile (y/n): " confirm
	if [[ $confirm == "y" || $confirm == "Y" ]]; then
		crontab -r
		echo "Toate task-urile au fost eliminate."
	else 
		echo "Operatiune anulata."
	fi

}


while true; do

echo "=============================="
    echo "      TASK SCHEDULER"
    echo "=============================="
    echo "1. Afișează task-urile (List)"
    echo "2. Adaugă un task nou (Add)"
    echo "3. Șterge toate task-urile (Remove)"
    echo "4. Ieșire (Exit)"
    echo "------------------------------"
    read -p "Selectează o opțiune [1-4]: " choice

	case $choice in 
		1) list_tasks ;;
		2) add_task ;;
		3) remove_tasks ;;
		4) exit 0 ;;
		*) echo "Optiune invalida!" ;;
	esac
done
