#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : NevermoreSSH
# (C) Copyright 2022
# =========================================
P='\e[0;35m'
B='\033[0;36m'
N='\e[0m'
clear
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e "             ═══[Vmess]═══"
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e " 1)  Create Vmess Account"
echo -e " 2)  Trial Vmess Account"
echo -e " 3)  Check User Login Vmess"
echo -e " 4)  Deleting Vmess Account"
echo -e " 5)  Renew Vmess Account"
echo -e " 6)  List Member Vmess"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e " 0)   MENU UTAMA"
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo ""
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       add-ws
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 2 ]]; then
       trial-ws
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 3 ]]; then
       cek-ws
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 4 ]]; then
       del-ws
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 5 ]]; then
       renew-ws
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 6 ]]; then
       user-ws
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 0 ]]; then
       clear
       funny
    else
       clear
       menu-ws
    fi
fi