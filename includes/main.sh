#!/bin/bash
echo "Choose one of the following possibilities:"
echo " 1 - full configuration"
echo " 2 - only ords configuration"
echo " 3 - reconfigure ords"


while true; do
    read -p "Choice: " choice
    case $choice in
        [1]* ) echo "full config"; break;;
		[2]* ) echo "ords config"; break;;
		[3]* ) echo "reconfgire ords"; break;;
        * ) echo "Select one of the possibilities!";
    esac
done

