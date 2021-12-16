#!/bin/bash
echo "Introduce tu edad"
read edad
let div=$edad%12
case $div in
0) echo "Tu horoscopo chino es el mono";;
1) echo "Tu horoscopo chino es el gallo";;
2) echo "Tu horoscopo chino es el perro";;
3) echo "Tu horoscopo chino es el cerdo";;
4) echo "Tu horoscopo chino es el rata";;
5) echo "Tu horoscopo chino es el buey";;
6) echo "Tu horoscopo chino es el tigre";;
7) echo "Tu horoscopo chino es el conejo";;
8) echo "Tu horoscopo chino es el dragon";;
9) echo "Tu horoscopo chino es el serpiente";;
10) echo "Tu horoscopo chino es el caballo";;
11) echo "Tu horoscopo chino es el cabra";;
*) echo "Error: no es posible identificar"
esac
