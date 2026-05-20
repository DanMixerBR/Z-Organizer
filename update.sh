#!/bin/bash

# ======================================================================
# Auto-Launch in Terminal
# Verifica se NÃO está rodando interativamente e abre o terminal correto
# ======================================================================
if [ ! -t 0 ]; then
    command -v ptyxis >/dev/null && exec ptyxis -- bash -c "\"$0\""
    command -v kgx >/dev/null && exec kgx -e bash -c "\"$0\""
    command -v gnome-terminal >/dev/null && exec gnome-terminal -- bash -c "\"$0\""
    command -v xterm >/dev/null && exec xterm -e bash -c "\"$0\""
fi

# ANSI Color Definitions
ESC="\e"
G="${ESC}[92m"
C="${ESC}[96m"
W="${ESC}[0m"
Y="${ESC}[93m"

clear
echo -e "${C}=======================================================${W}"
echo -e "          ${G}Zarfolder${W} - ${Y}Update Manager${W}"
echo -e "${C}=======================================================${W}"
echo ""

echo -e "${C}[${W}*${C}]${W} Status: ${Y}Extracting new files...${W}"

# Extração silenciosa
unzip -o Zarfolder_Linux.zip -d .. > /dev/null 2>&1

chmod +x Zarfolder

rm -f "Zarfolder_Linux.zip" "Z-Organizer" "../Install_Z-Organizer.sh"

echo ""
echo -e "${G}-------------------------------------------------------${W}"
echo "  [SUCCESS] Update completed!"
echo "  Starting Zarfolder..."
echo -e "${G}-------------------------------------------------------${W}"
echo ""

nohup ./Zarfolder >/dev/null 2>&1 &
disown

sleep 2

# Self-deletion
rm -- "$0"
