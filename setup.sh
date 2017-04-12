#!/bin/bash
echo "Updating..."
git pull
echo;
chmod +x ./includes/*.sh
./includes/start.sh