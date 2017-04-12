#!/bin/bash
sed "s/changefmw.softbase.dk/$1/" /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/config.xml > new_config.xml

mv /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/config.xml /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/config.xml.original
mv new_config.xml /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/config.xml
