#!/bin/bash

GREEN='\e[32m'
RED='\e[31m'
BLUE='\e[34m'
YELLOW='\e[33m'
RESET='\e[0m'

exit_gracefully() {
    echo -e "\n${YELLOW}Joc intrerupt. PA PA!${RESET}"
    tput cnorm
    exit 0
}
trap exit_gracefully SIGINT

draw_ui() {
    clear
    tput civis
    echo -e "${BLUE}======================================${RESET}"
    echo -e "${BLUE}||      ${YELLOW}BINE AI VENIT LA TYPER${BLUE}      ||${RESET}"
    echo -e "${BLUE}======================================${RESET}"
}

select_settings() {
    echo -e "\nAlege dificultatea (secunde):"
    echo "1. usor (10s) 2. mediu (5s) 3. greu (3s)"
    read -p "Optiune: " diff_choice

    case $diff_choice in
        1) timeout=10 ;;
        2) timeout=5 ;;
        3) timeout=3 ;;
        *) timeout=5 ;;
    esac

    echo -e "\nAlege ce vrei sa exersezi:"
    echo "1. Litere 2. Cifre"
    read -p "Optiune: " cat_choice
}

start_game() {
    draw_ui
    tput cnorm

    if [ "$cat_choice" == "1" ]; then
        target=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 5 | head -n 1)
    else
        target=$(cat /dev/urandom | tr -dc '0-9' | fold -w 5 | head -n 1)
    fi

    echo -e "\nScrie urmatorul text rapid: ${GREEN}$target${RESET}"

    start_time=$SECONDS
    read -p "Input: " user_input
    end_time=$SECONDS
    duration=$(( end_time - start_time ))

    if [ "$user_input" == "$target" ] && [ $duration -le $timeout ]; then
        echo -e "\n${GREEN}BRAVO!${RESET} Ai reusit in $duration secunde."
    else 
        echo -e "\n${RED}AI PIERDUT!${RESET}"
        [ "$user_input" != "$target" ] && echo "Greseala de scriere."
        [ $duration -gt $timeout ] && echo "Prea lent! (Timp: ${duration}s, Limita: ${timeout}s)"
    fi
}

select_settings
while true; do
    start_game
    read -p "Mai joci o data? (Y/N): " op
    if [[ "$op" != "Y" && "$op" != "y" ]]; then
        exit_gracefully
    fi
done
