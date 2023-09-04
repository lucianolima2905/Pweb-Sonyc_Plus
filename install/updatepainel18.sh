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
echo -e "           \033[1;33m● \033[1;32mATUALIZANDO LINUX, Pode Demorar \033[1;33m●\033[0m"
fun_update () {
    apt-get update -y > /dev/null 2>&1 
	apt-get install figlet -y > /dev/null 2>&1
}
fun_bar 'fun_update'
echo ""
clear
#
IP=$(wget -qO- ipv4.icanhazip.com)
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
IP=$(wget -qO- ipv4.icanhazip.com)
clear
echo -e "\E[44;1;37m    ATUALIZANDO O PAINELWEB SWIT-T     \E[0m"
echo ""
echo -e "                              \033[1;31mBy @swittecnologia\033[1;36m"
echo -e "   P-SWIT-T" | figlet
echo ""
clear
#
senha=$(cut -d"'" -f2 /var/www/html/pages/system/pass.php)
empresaatual=$(cut -d"'" -f2 /var/www/html/empresa)
echo ""
echo -e "           \033[1;33m● \033[1;32mFINALIZANDO A ATUALIZAÇÃO, PODE DEMORAR \033[1;33m● \033[1;33mAGUARDE...\033[0m"
cd /var/www/html || exit
rm -rf * > /dev/null 2>&1
wget https://github.com/JeanRocha91x/psshplus-/raw/main/gestorssh/gestorssh18.zip > /dev/null 2>&1
sleep 1
unzip -o gestorssh18.zip > /dev/null 2>&1
rm -rf gestorssh18.zip index.html > /dev/null 2>&1
mkdir /root/backupsql > /dev/null 2>&1
chmod 777 /root/backupsql > /dev/null 2>&1
chmod 777 -R /var/www/html > /dev/null 2>&1
_key=$(echo $(openssl rand -hex 5))
sed -i "s;49875103u;$_key;g" /var/www/html/pages/system/config.php > /dev/null 2>&1
sed -i "s;localhost;$IP;g" /var/www/html/pages/system/config.php > /dev/null 2>&1
sleep 1
if [[ -e "/var/www/html/pages/system/pass.php" ]]; then
sed -i "s;1020;$senha;g" /var/www/html/pages/system/pass.php > /dev/null 2>&1
fi
#
clear
cd || exit
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/empresa > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/home.php > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/index.php > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/login.php > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/admin/home.php > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/admin/index.php > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/admin/login.php > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/apps/index.php > /dev/null 2>&1
sed -i "s;EMPRESA;$empresaatual;g" /var/www/html/apps/termos.php > /dev/null 2>&1
echo ""
service apache2 restart > /dev/null 2>&1
echo ""
echo -e "                              \033[1;31mBy @swittecnologia\033[1;36m"
echo -e "   P-SWIT-T" | figlet
echo ""
echo -e "\033[1;36m PAINELWEB DIGITE ESSE IP NO NAVEGADOR:\033[1;37m http://$IP/admin\033[0m"
echo ""
echo -e "\033[1;36m LOJA DE APPS:\033[1;37m http://$IP/apps\033[0m"
echo ""
echo -e "\033[1;33m MAIS INFORMAÇÕES \033[1;31m(\033[1;36mTELEGRAM\033[1;31m): \033[1;37m@swittecnologia\033[0m"
echo ""
sleep 20
service apache2 restart > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
clear
pweb
