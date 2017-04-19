#!/bin/bash
echo "Choose one of the following possibilities:"
echo " 1 - Full Configuration"
echo " 2 - Only ORDS Configuration"
echo " 3 - Reconfigure ORDS"
echo " q - Exit"

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