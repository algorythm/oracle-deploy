#!/bin/bash
echo "Removing old ords files"
rm -rf /usr/share/tomcat/webapps/ords*
cd /home/tomcat/ordstomcat
rm -rf docs logs ordstomcatconf params examples ords.war readme.html
unzip ords.*.zip

./includes/configure_ords.sh