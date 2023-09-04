#!/bin/bash
clear
mkdir backupsql > /dev/null 2>&1
chmod 777 backupsql > /dev/null 2>&1
rm /root/backupsql/sshplus.sql > /dev/null 2>&1
senha=$(cat /var/www/html/pages/system/pass.php |cut -d"'" -f2)
mysqldump -u root -p$senha sshplus > /root/backupsql/sshplus.sql
