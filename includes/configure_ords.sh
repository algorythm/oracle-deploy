#!/bin/bash
cd /home/tomcat/ordstomcat/
read -p "Enter name for Database Server: " db_server
read -p "Enter port for Database Server (1521): " db_port
read -p "Enter name Database Name: " db_name
echo -n "Enter Database Password: "
read -s db_pwd

if [ -z ${db_port} ]; then
    db_port="1521"
fi

echo;

echo "Database Server   = $db_server"
echo "Database Port     = $db_port"
echo "Database Name     = $db_name"
echo "Database Password = $db_pwd"

while true; do
    read -p "Is the information above correct [Y/n]? " yn
    case $yn in
        [Nn]* ) exit; break;;
        * ) echo "Continueing...";break;;
    esac
done

java -jar ords.war << END
tomcatconfig
$db_server
$db_port
1
$db_name
ORDS_PUBLIC_USER
<INSERT_PASSWORD_HERE>
<INSERT_PASSWORD_HERE>
1
<INSERT_PASSWORD_HERE>
<INSERT_PASSWORD_HERE>
1
<INSERT_PASSWORD_HERE>
<INSERT_PASSWORD_HERE>
<INSERT_PASSWORD_HERE>
<INSERT_PASSWORD_HERE>
2
END

chown -R tomcat:tomcat /home/tomcat
ln -s /home/ordstomcat/ords.war /usr/share/tomcat/webapps/

