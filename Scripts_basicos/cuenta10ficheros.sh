#!/bin/bash

if [ $# -eq 1 ]
then
	if [ -d $1 ]
	then
	cont=0
		for i in `ls $1`
		do
			if [ -f $1/$i ]
			then
			cont=$((cont+1))
			fi
		done
		if [ $cont -gt 10 ]
		then
		echo "Hay más de 10 ficheros"
		else
		echo "Hay menos de 10 ficheros"
		fi
	else
	echo "El parametro introducido no es un directorio"
	fi
else
echo "Introduce mínimo un parametro"
fi
