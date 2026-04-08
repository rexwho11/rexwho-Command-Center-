#!/bin/bash

# Colors
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

# Banner
banner(){

clear

echo ""


echo -e "$RED           ================ DISCLAIMER ================$RESET"

echo -e "$YELLOW"
echo " This toolkit is for ethical hacking "
echo " and educational purpose only."
echo
echo "Don't attack systems without permission."
echo 
echo " Use wisely"
echo
echo


echo -e "$RED"
echo "██████╗ ███████╗██╗  ██╗██╗    ██╗██╗  ██╗ ██████╗ "
echo "██╔══██╗██╔════╝╚██╗██╔╝██║    ██║██║  ██║██╔═══██╗"
echo "██████╔╝█████╗   ╚███╔╝ ██║ █╗ ██║███████║██║   ██║"
echo "██╔══██╗██╔══╝   ██╔██╗ ██║███╗██║██╔══██║██║   ██║"
echo "██║  ██║███████╗██╔╝ ██╗╚███╔███╔╝██║  ██║╚██████╔╝"
echo "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝"
echo ""
echo -e "$CYAN        rexwho cyber toolkits$RESET"
echo -e "$CYAN     All-in-One Recon & Scanning Tool$RESET"
echo 
}

# Loading animation
loading(){

echo -e "$YELLOW Initializing modules...$RESET"
sleep 0.5
echo "."
sleep 0.5
echo ".."
sleep 0.5
echo "..."
sleep 0.5

}

# Auto installer
install_tools(){

echo -e "$GREEN Installing required tools...$RESET"

sudo apt install -y nmap whois dnsutils curl openssl inxi gobuster dig 

echo "Installation complete"

}

# Network Scanner
network_scan(){

echo "Enter network range (eg: 10.10.1.10)"
read network

nmap -sS   $network
echo ""
nmap -sn $network
}

# Port Scanner
port_scan(){

echo "Enter target IP: "
read target

nmap -p- $target

}

# Web Recon
web_recon(){

echo "Enter domain"
read domain

echo "IP Address:"
host $domain

echo ""
echo "DNS Records:"
dig $domain

echo ""
echo "Whois Info:"
whois $domain

echo ""
echo "what web"
whatweb $domain

}

# Subdomain Finder
subdomain_finder(){

echo "Enter domain"
read domain

subfinder -d $domain


echo ""
echo "extara subdomain"
echo ""
assetfinder  $domain
}

# Directory Bruteforce
dir_scan(){

echo "Enter website URL (eg:- https://abugidasecurity.com): "
read url



echo "Enter wordlist path:"
read wordlist

gobuster dir -u "$url" -w "$wordlist"

}

# Encrypt / Decrypt
crypto(){

echo "1 Encrypt"
echo "2 Decrypt"

read option

if [ $option == 1 ]; then

echo "Enter text"
read text

echo $text | base64

else

echo "Enter encoded text"
read text

echo $text | base64 -d

fi

}

# Password Generator
password_gen(){

echo "Enter password length: "
read length

openssl rand -base64 48 | cut -c1-$length

}

# Lookup
lookup(){

echo "Enter domain or IP"
read target

nslookup $target

echo ""
dig $target
}

# Auto Report
report(){

echo "Creating report..."

file="report_$(date +%s).txt"

echo "Report generated at $(date)" > $file
echo "" >> $file

echo "System Info:" >> $file
uname -a >> $file

echo "" >> $file

echo "Network Info:" >> $file
ip a >> $file



echo "" >> $file 

echo "Linux distribution (OS)" >> $file
cat /etc/os-release >> $file

echo "" >> $file

echo "system identity and hardware information" >> $file
hostnamectl >> $file

echo "" >> $file

echo "full system hardware information" >> $file
inxi -F  >> $file

echo ""

echo "Saved to $file"

}

# Main Menu
while true
do

banner
loading

echo  "1 Network Scanner"
echo  "2 open Port Scanner"
echo  "3 Website Recon"
echo  "4 Subdomain Finder"
echo  "5 Directory Bruteforce"
echo  "6 cryptography"
echo  "7 Password Generator"
echo  "8 Find ip addressess"
echo  "9 My linux info report"
echo "10 Install Tools"
echo "11 Exit"

echo ""
read -p "Select option: " option

case $option in

1) network_scan ;;
2) port_scan ;;
3) web_recon ;;
4) subdomain_finder ;;
5) dir_scan ;;
6) crypto ;;
7) password_gen ;;
8) lookup ;;
9) report ;;
10) install_tools ;;
11) exit ;;

*) echo "Invalid option" ; sleep 2 ;;

esac

read -p "Press Enter to continue..."

done
