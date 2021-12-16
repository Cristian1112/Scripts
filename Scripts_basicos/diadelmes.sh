#!/bin/bash
mes=`date +%m`
echo "Estamos en el mes de `date +%B`"
case $mes in
1|3|5|7|8|10|12) echo "Este mes tiene 31 días";;
4|6|9|11) echo "Este mes tiene 30 días";;
2) echo "Este mes tiene 28 días";;
esac
