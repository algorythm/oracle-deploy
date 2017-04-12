#!/bin/bash
rm /etc/httpd/sites-enabled/002*
rm /etc/httpd/sites-enabled/form*.conf
rm /etc/httpd/sites-enabled/report*.conf
rm /etc/httpd/sites-available/002*
rm ./new_hosts.txt
rm ./new_formsweb.cfg
rm ./new_config.xml
ln -s /etc/httpd/sites-available/001-sbsv12master.softbase.dk.conf /etc/httpd/sites-enabled/
