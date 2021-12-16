#!/bin/bash
ano=`date +%Y`
echo "Introduce una edad entre 15 y 65 años."
read edad
resto=$(($ano-$edad))
dec=`echo $resto | cut -c3`
case $dec in
6) echo "Eres de la decada de los 60";;
7) echo "Eres de la decada de los 70";;
8) echo "Eres de la decada de los 80";;
9) echo "Eres de la decada de los 90";;
0) echo "Eres de la decada de los 2000";;
*) echo "No has introducido una edad válida";;
esac
