#!/bin/bash
rep=0
while [ $rep != n ]
do
	echo "Introduzce el nombre de un usuario"
	read usu
	if [ $usu = -list ]
	then
		grep -w /bin/bash$ /etc/passwd | cut -d: -f1 | sort
	elif ! id $usu &> /dev/null
	then
		echo "El usuario que has introducido no existe"
	else
		echo "Usuario $usu verificado"
		echo "UID: $(grep -w ^$usu /etc/passwd | cut -d: -f3)"
		echo "GID: $(grep -w ^$usu /etc/passwd | cut -d: -f4)"
		echo "Home: $(grep -w ^$usu /etc/passwd | cut -d: -f6)"
	fi
	read -p "¿Quieres introducir otro usuario?(s/n)" rep
done
