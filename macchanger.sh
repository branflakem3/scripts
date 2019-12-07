#!/bin/bash

#DEFINED COLOR SETTINGS
RED=$(tput setaf 1 && tput bold)
GREEN=$(tput setaf 2 && tput bold)
STAND=$(tput sgr0)
BLUE=$(tput setaf 6 && tput bold)
 
echo -n " Finding your Network Interfaces for you... "$GREEN
sleep 2
echo ""
ifconfig -a | cut -d " " -f1 | sed '/^$/d' | egrep -v 'lo|vm'
echo ""

echo $BLUE" Please enter the the interface you want the mac to change for EG. mon0 or wlan0: "
read NIC
echo ""
sleep 2
clear

echo " Taking Interface Down... "
ifconfig $NIC down
sleep 2
echo ""
echo ""
echo " Changing MAC address... "
macchanger -r $NIC
sleep 2
echo ""
echo ""
echo " Bringing Interface Up... "
ifconfig $NIC up
echo ""
echo ""
echo "Mac is now random Thank you for using MAC changer! "
echo ""
echo ""
read -p "Please press ENTER to exit the script"
