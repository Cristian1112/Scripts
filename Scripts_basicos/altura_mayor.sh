#!/bin/bash
metros1=$(($1/100))
metros2=$(($2/100))
metros3=$(($3/100))
metros_1=$(($1%100))
metros_2=$(($2%100))
metros_3=$(($3%100))
if [ $# -eq 3 ]
then
	if [ $1 -gt $2 -a $1 -gt $3 ]
	then
		echo "$metros1,$metros_1 es el más grande"
	elif [ $1 -gt $2 -a $1 -lt $3 ]
	then
		echo "$metros3,$metros_3 es el más grande"
	elif [ $1 -lt $2 -a $2 -gt $3 ]
	then
		echo "$metros2,$metros_2 es el más grande"
	elif [ $1 -lt $2 -a $2 -lt $3 ]
	then
		echo "$metros3,$metros_3 es el más grande"
	else
		echo "Hay parametros iguales"
	fi
else
	echo "Introduce 3 parámetros"
fi
