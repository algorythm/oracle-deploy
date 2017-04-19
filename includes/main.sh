#!/bin/bash
echo "Choose one of the following possibilities:"
echo " 1 - full configuration"
echo " 2 - only ords configuration"
echo " 3 - reconfigure ords (test)"


while true; do
    read -p "Choice: " choice
    case $choice in
        [1]* ) echo ./includes/full-config.sh break;;
		[2]* ) echo ./includes/ords.sh break;;
		[3]* ) echo ./includes/test.sh break;;
        * ) echo "Select one of the possibilities!";
    esac
done

