#!/bin/bash

# Comprobar si 7z está instalado
which 7z > /dev/null 2>&1


# Si el código de salida es distinto de cero, significa que no está instalado
if [ $? -ne 0 ]; then
    echo -e "\e[31mLa herramienta 7z no está instalada, se instalará"
        sleep 1
    # Instalar 7z según la distribución de Linux
    # Para Debian, Ubuntu o Linux Mint
    sudo apt install p7zip
    # Termux
        apt install p7zip
fi



# Continuar con el script
echo
clear
echo -e "\e[32mLa herramienta 7z está instalada"
sleep 1
clear


function ctrl_c(){
        clear
        echo -e "\e[40m\e[31m|-----------------|\e[0m"
        echo -e "\e[40m\e[31m|[!]Hasta Luego!! |\e[0m"
        echo -e "\e[40m\e[31m|-----------------|\e[0m"
        sleep 0.5
        clear
        exit 0
}

# Ctrl+C
trap ctrl_c INT



# Menú

echo
while true; do
echo
echo -e "\e[40m\e[31m|--------------------------------------------------|\e[0m"
echo -e "\e[40m\e[31m| ░█▀▄░█▀▀░█▀▀░█▀█░█▄█░█▀█░█▀▄░█▀▀░█▀▀░█▀▀░█▀█░█▀▄ |\e[0m"
echo -e "\e[40m\e[31m| ░█░█░█▀▀░█░░░█░█░█░█░█▀▀░█▀▄░█▀▀░▀▀█░▀▀█░█░█░█▀▄ |\e[0m"
echo -e "\e[40m\e[31m| ░▀▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀ |\e[0m"
echo -e "\e[40m\e[31m|--------------------------------------------------|\e[0m"
echo -e "\e[40m\e[31m| \e[34m1) \e[34mInformacion del comprimido\e[31m |\e[0m"
echo -e "\e[40m\e[31m| \e[34m2) \e[34mDescomprimir Comprimido    \e[31m|\e[0m"
echo -e "\e[40m\e[31m| 3) Salir\e[40m                      |\e[0m"
echo -e "\e[40m\e[31m|-------------------------------|\e[0m"
echo
echo -e "\e[40m|-------------------------|\e[0m"
read -p "  Selecciona Una Opcion: " opcion
echo -e "\e[40m|-------------------------|\e[0m"
echo
        case $opcion in
        1)
        echo
        clear
        echo -e "\e[40m|--------------------------------------------------------|\e[0m"
        echo -e "\e[40m| Seleccione el nombre del archivo para ver el contenido |\e[0m"
        echo -e "\e[40m|--------------------------------------------------------|\e[0m"
        ls
        echo -e "\e[31m\e[40m|--------------------------------------------------------|\e[0m"
         read -r nombre_archivo
        echo -e "\e[31m\e[40m|--------------------------------------------------------|\e[0m"
        7z l $nombre_archivo | awk '/-----/{flag=!flag; next} flag' | awk 'NF{print $NF}'
        echo -e "\e[0m\e[40m|--------------------------------------------------------|\e[0m"
        ;;
        2)
        echo
        clear
        echo -e "\e[40m|--------------------------------------------------------|\e[0m"
        echo -e "\e[40m|    Seleccione el nombre del archivo a descomprimir     |\e[0m"
        echo -e "\e[40m|--------------------------------------------------------|\e[0m"
        ls
        echo -e "\e[31m\e[40m|--------------------------------------------------------|\e[0m"
        read -r nombre_archivo
        clear
        echo -e "\e[31m\e[40m|--------------------------------------------------------|\e[0m"
        7z x $nombre_archivo
        clear
        echo -e "\e[0m\e[42m|-----------------------------|\e[0m"
        echo -e "\e[32m[✓]¡Archivo extraido con éxito!\e[0m"
        echo -e "\e[0m\e[42m|-----------------------------|\e[0m"
        ;;
        3)
        clear
        echo -e "\e[40m\e[31m|-----------------|\e[0m"
        echo -e "\e[40m\e[31m|[!]!Hasta Luego! |\e[0m"
        echo -e "\e[40m\e[31m|-----------------|\e[0m"
        sleep 2
        clear
        exit
        ;;
        *)
        clear
        echo -e "\e[40m\e[31m|-----------------|\e[0m"
        echo -e "\e[40m\e[31m|[!]!Hasta Luego! |\e[0m"
        echo -e "\e[40m\e[31m|-----------------|\e[0m"
        sleep 2
        clear
        exit
        ;;
        esac
done
