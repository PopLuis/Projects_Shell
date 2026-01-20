#!/bin/bash

# Funcție pentru a afișa întrebările
quiz_question() {
    local intrebare=$1
    local varianta_a=$2
    local varianta_b=$3
    local raspuns_corect=$4

    echo -e "\n--- ÎNTREBARE ---"
    echo "$intrebare"
    echo "A) $varianta_a"
    echo "B) $varianta_b"
    
    read -p "Alege răspunsul (A/B): " user_input
    
    # Transformăm input-ul în literă mare pentru siguranță
    user_input=$(echo "$user_input" | tr '[:lower:]' '[:upper:]')

    if [ "$user_input" == "$raspuns_corect" ]; then
        echo -e "\033[0;32mCORECT!\033[0m"
        return 0
    else
        echo -e "\033[0;31mGREȘIT! Răspunsul era $raspuns_corect.\033[0m"
        return 1
    fi
}

# START QUIZ
scor=0

echo "Bun venit la Quiz-ul Linux Shell!"

# Întrebarea 1
quiz_question "Ce comandă afișează doar numele fișierului în grep?" "grep -l" "grep -n" "A"
[ $? -eq 0 ] && scor=$((scor+1))

# Întrebarea 2
quiz_question "Cum golești rapid un fișier?" "rm fișier" "> fișier" "B"
[ $? -eq 0 ] && scor=$((scor+1))

# Întrebarea 3
quiz_question "Ce face 'chmod +x'?" "Șterge fișierul" "Dă permisiuni de rulare" "B"
[ $? -eq 0 ] && scor=$((scor+1))

echo -e "\n----------------------------"
echo "Quiz terminat! Scorul tău: $scor/3"
