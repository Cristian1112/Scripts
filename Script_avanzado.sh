#!/bin/bash
#La función existe sirve para hacer que si el usuario aparece en el texto usuarios.csv retorne en 1 y si no existe retorne en 2.
function existe {
	if grep -q -w $usu usuarios.csv
	then
		return 1
	else
		return 2
	fi
}
#La función menu es una simple función que muestra por pantalla ese listado de echo’s para crear el menu.
function menu {
	echo "Qué operación deseas realizar?"
	echo "1.-Copia de seguridad"
	echo "2.-Dar de alta usuario"
	echo "3.-Dar de baja al usuario"
	echo "4.-Mostrar usuarios"
	echo "5.-Mostrar log del sistema"
	echo "6.-Salir"
}
#La función cs sirve para hacer la copia de seguridad, con tar hago la copia de seguridad con un date dentro sobre el archivo usuarios.csv, lo muestro con un echo por mantalla y mando otro al archivo log.log.
function cs {
	clear
	tar -cf copia_usuarios_`date +%d%m%Y_%H-%M-%S`.tar usuarios.csv
	echo "Copia de seguridad creada correctamente"
	echo "COPIA SEGURIDAD creada el `date +%d%m%Y` a las `date +%H:%M`h" >> log.log
}
#La función alta para dar de alta al usuario, primero introduzco 4 read para añadir las 4 variables de los datos del usuario, luego creo 5 variables, las 4 primeras son unas variables con 3 funciones, un echo sobre la variable read a la que va destinada, un cut para recoger los caracteres necesarios y un tr para convertir en minúscula, luego viene la quinta variable que recoge en un echo el resultado de las 4 anteriores.
#Luego pongo la variable existe, si retorna en 1 el valor de val, entonces avisara que el usuario ya esta de alta, si no, lo creara añadiendo todos los datos marcados en el echo al fichero usuarios.csv, lo avisara por pantalla y además mandara otro echo al fichero log.log.
function alta {
	clear
	read -p "Introduce tu nombre: " nom
	read -p "Introduce tu primer apellido: " ape
	read -p "Introduce tu segundo apellido: " ape2
	read -p "Introduce tu DNI (9 dígitos con la letra): " dni
	n=`echo $nom | cut -c1 | tr [:upper:] [:lower:]`
	a1=`echo $ape | cut -c1,2,3 | tr [:upper:] [:lower:]`
	a2=`echo $ape2 | cut -c1,2,3 | tr [:upper:] [:lower:]`
	d=`echo $dni | cut -c6,7,8 | tr [:upper:] [:lower:]`
	usu=`echo "$n$a1$a2$d"`
	existe
	val=$?
	if [ $val -eq 1 ]
	then
		echo "Usuario ya esta dado de alta"
	else
		echo "$nom:$ape:$ape2:$dni:$usu" >> usuarios.csv
		echo "El usuario se ha dado de alta correctamente"
		echo "INSERTADO $nom:$ape:$ape2:$dni:$usu el `date +%d%m%Y` a las `date +%H:%M`h" >> log.log

	fi
}
#La función baja para dar de baja a un usuario, introduzco un read para recoger la variable, luego añado la función existe y recojo el valor de val, hago un if donde digo que si val es igual a 1, entonces primero mando el mensaje de aviso de borrado al log.log, porque si lo pongo después no recogera al usuario borrado, y después mando el grep -v a un archivo nuevo, después sobrescrivo el fichero con el mismo nombre que el anterior, para así borrar el usuario, y avisara por pantalla. Si val no es 1 entonces avisara que el usuario no esta dado de alta.
function baja {
	clear
	read -p "Introduce el usuario: " bajau
	existe
	val=$?
                  if [ $val -eq 1 ]
	then
	                  echo "BORRADO `grep $usu usuarios.csv` el `date +%d%m%Y` a las `date +%H:%M`h" >> log.log
                                   grep -v "$usu" usuarios.csv > usuarios2.csv
		mv usuarios2.csv usuarios.csv
		echo "El usuario se ha dado de baja correctamente"
                  else
                                   echo "Este usuario no esta dado de alta"
                  fi
}
#La función mu para mostrar la lista de usuarios del archivo usuarios.csv, primero hago un simple echo como título, luego hago el cat para visualizar el contenido y lo ordeno con un sort. Luego mando un aviso al log de que se listo los usuarios del sistema.
function mu {
	clear
	echo "Usuarios del sistema:"
	cat usuarios.csv | sort
	echo "LISTADO los usuarios del sistema el `date +%d%m%Y` a las `date +%H:%M`h" >> log.log
	sleep 5
}
#La función log mostrará los logs del sistema guardados en el archivo log.log, con un cat mostramos el archivo.
function log {
	clear
	cat log.log
	sleep 5
}
#Ahora hago dos if, en el primero indico que si el archivo usuario.csv no existe, se crea. En el segundo if hago lo mismo pero añadiendole que si el archivo ya existe, añada una linea con la fecha del momento al archivo. Esto es lo primero que se activara al iniciar el script.
if [ ! -f usuarios.csv ]
then
	touch usuarios.csv
fi
if [ ! -f log.log ]
then
	touch log.log
else
	echo "------------`date +%d%m%Y:%H:%M`------------" >> log.log
fi
#Inicio la variable val en 2 y creo un bucle while, en el que indico que mientras la variable val siga siendo 2 el bucle seguira repitiendose.
#Recojo la variable usu con un read, añado la función existe y recojo la variable val. Creo un if que indica que si la variable val retorna en 1 o el usuario es igual a admin entonces verifico el usuario, dandole valor 1 a la variable val para cerrar el bucle, si no, el usuario no es válido y el bucle sigue ejecutandose.
val=2
while [ $val -eq 2 ]
do
	read -p "Introduzca el nombre de usuario: " usu
	existe
	val=$?
	if [ $val -eq 1 -o $usu == "admin" ]
	then
		echo "Usuario verificado correctamente"
		val=1
	else
		echo "El usuario introducido no es válido"
	fi
done
sleep 2
clear


#Si el bucle anterior se cierra, la variable op iniciará en 0 y se activara otro bucle con la función menu, este bucle seriga funcionando mientras la variable op no sea 6, que a las misma vez es la opción de salida del case, en el bucle después del menu tenemos un read que recoge por pantalla la variable op que habíamos iniciado antes, y luego el case con las opciones, la opción 1 activara la función copia de seguridad, la opción 2 el alta, la opción 3 la baja, la 4 la lista de usuarios, la 5 los logs, la 6 la salida del bucle y la finalización del script, y cualquier otra opción se dara un mensaje como no válida.
op=0
while [ $op -ne 6 ]
do
	menu
	read op
	case $op in
		1) cs
		sleep 2
		clear;;
		2) alta
		sleep 2
		clear;;
		3) baja
		sleep 2
		clear;;
		4) mu;;
		5) log;;
		6) exit;;
		*) echo "Opción no válida";;
	esac
done
