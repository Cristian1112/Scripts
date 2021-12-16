#!/bin/bash
op=0
function numero1 {
	read -p "Introduce el primer número: " num1
}
function numero2 {
	read -p "Introduce el segundo número: " num2
}
function suma {
	sum=`expr $num1 + $num2`
}
function resta {
        res=`expr $num1 - $num2`
}
function division {
        div=`expr $num1 / $num2`
}
function multiplica {
        mul=`expr $num1 \* $num2`
}
while [ $op -ne 5 ]
do
	echo "¿Qué operación deseas realizar?"
	echo "1)Sumar"
	echo "2)Restar"
	echo "3)Dividir"
	echo "4)Multiplicar"
	echo "5)Salir"
	read op
		case $op in
		1) numero1
		numero2
		suma
		echo "El resultado es: $sum";;
		2) numero1
		numero2
		resta
		echo "El resultado es: $res";;
		3) numero1
		numero2
		division
		echo "El resultado es: $div";;
		4) numero1
		numero2
		multiplica
		echo "El resultado es: $mul";;
		5) exit;;
		*) echo "Error, operación no válida"
		2> /home/cristian/errores_cal.txt;;
		esac
done
