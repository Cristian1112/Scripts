#!/bin/bash
echo "Escribe el directorio que quieras comprimir: "
read dir
if [ -d $dir ]
then
tar -cf copia_scripts_`date +%d%m%Y`.tar *.sh
echo "Se ha comprimido correctamente"
else
echo "La carpeta $dir no existe"
fi


