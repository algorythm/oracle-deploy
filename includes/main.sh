#!/bin/bash
echo "Choose one of the following possibilities:"
echo " 1 - full configuration"
echo " 2 - only ords configuration"
echo " 3 - reconfigure ords (test)"
echo " q - exit"


while true; do
    read -p "Choice: " choice
    case $choice in
        [1]* ) ./includes/full-config.sh; break;;
		[2]* ) ./includes/ords.sh; break;;
		[3]* ) ./includes/reconfigure_ords.sh; break;;
		[q]* ) echo "Exiting..."; break;;
        * ) echo "Select one of the possibilities!";
    esac
done

