#!/bin/bash

if [ $EUID != 0 ]
then
  echo "Please run this script as root so as to see all details! Better run with sudo."
  exit 1
fi

green="\e[0;92m"
reset="\e[0m"
red="\e[0;91m"
bold="\e[1m"
blue="\e[0;94m"

echo -e "${blue}

     ██╗███████╗ ██████╗ ██████╗ ███╗   ██╗
     ██║██╔════╝██╔════╝██╔═══██╗████╗  ██║
     ██║███████╗██║     ██║   ██║██╔██╗ ██║
██   ██║╚════██║██║     ██║   ██║██║╚██╗██║
╚█████╔╝███████║╚██████╗╚██████╔╝██║ ╚████║
 ╚════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝   ${reset}

                - ${red}Made With 💗 By Omkar Mali${reset}
                                               "

echo -e "${red}=========================================================${reset}"
echo -e "${green}${bold}Start Collecting URLS From Targets${reset}"
echo -e "${red}=========================================================${reset}"
for i in $(cat $1); do echo "$i"; done | gau -subs | anew | tee -a gau.txt;

echo -e "${red}=========================================================${reset}"
echo -e "${green}${bold}Extracting Unique Live Js Files${reset}"
echo -e "${red}=========================================================${reset}"

for i in $(cat gau.txt); do echo "$i" | subjs; done | httpx -silent -mc 200 | anew | tee -a alljs.txt
