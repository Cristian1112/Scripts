#!/bin/bash
es_numero='^[0-9]+$'
read -p "Introduce dos números: " num1 num2
if [[ $num1 =~ $es_numero ]] && [[ $num2 =~ $es_numero ]]
then
sum=`expr $num1 + $num2`
suma_seq=`seq -s+ $num1 $num2 | bc`
echo "El resultado de la suma normal es: $sum"
echo "En seq: $suma_seq"
else
echo "Error al introducir los números"
fi


