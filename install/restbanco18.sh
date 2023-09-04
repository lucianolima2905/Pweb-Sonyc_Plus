#!/bin/bash
clear
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
echo ""
clear
#
mkdir /root/restaurar > /dev/null 2>&1
clear
echo ""
echo -e "                              \033[1;31mBy @swittecnologia\033[1;36m"
echo ""
echo -e "\033[1;33mRESTAURAR BANCO DE DADOS DO PAINEL SWIT-T!\033[0m" 
echo ""
echo -e "\n\033[1;33mÉ NECESSÁRIO O PAINEL INSTALADO E O\nAQUIVO (\033[1;32msshplus.sql\033[1;33m) NA PASTA (root/restaurar)!\033[0m\n"
echo ""
echo -ne "\033[1;32mDE UM ENTER PRA CONTINUAR...\033[0m"; read -r

[[ ! -e /var/www/html/pages/system/pass.php ]] && {
	echo -e "\n\033[1;31mO PAINEL NÃO ESTÁ INSTALADO !\033[0m"
	echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
cat /dev/null > ~/.bash_history && history -c
clear
pweb
}

[[ ! -e /root/restaurar/sshplus.sql ]] && {
	echo -e "\n\033[1;31mARQUIVO (\033[1;32msshplus.sql\033[1;31m) NÃO ENCONTRADO !\033[0m"
	echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
cat /dev/null > ~/.bash_history && history -c
clear
pweb
}

passdb=$(cut -d"'" -f2 /var/www/html/pages/system/pass.php)
[[ $(mysql -h localhost -u sshplus -p$passdb -e "show databases" | grep -wc sshplus) == '0' ]] && {
	echo -e "\n\033[1;31mSEU PAINELWEB NÃO É COMPATÍVEL !\033[0m"
	echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
cat /dev/null > ~/.bash_history && history -c
clear
pweb
}
mysql -h localhost -u sshplus -p$passdb -e "drop database sshplus"
mysql -h localhost -u sshplus -p$passdb -e 'CREATE DATABASE sshplus'
mysql -h localhost -u sshplus -p$passdb --default_character_set utf8 sshplus < /root/restaurar/sshplus.sql
echo -e "                              \033[1;31mBy @swittecnologia\033[1;36m"
echo ""
echo -e "\n\033[1;32mDADOS RESTAURADO COM SUCESSO!\033[0m"
echo ""
sleep 3
echo -e "\033[1;31mRETORNANDO...\033[0m"
rm /root/restaurar/*.sql > /dev/null 2>&1
sleep 2
cat /dev/null > ~/.bash_history && history -c
clear
pweb
