#!/bin/bash
segundos=$1
dir=$2
case ${} in [0-9]|[0-9][0-9]|[0-9][0-9][0-9])

#Para validar que no se ingrese cero segundos
if [ ! "0" -eq "$segundos" ]; then

#Para validar si el directorio ingresado existe
if [ -d "$dir" ]; then

ls -a -l $dir > antes.txt
hashI=`ls -a -l $dir | md5sum`
hashD=$hashI

while [ "$hashD" = "$hashI" ]; do
sleep $segundos
hashD=`ls -a -l $dir | md5sum`
done
echo ""
echo "==================================================="
echo "||           Antes de la modificacion             ||"
echo "==================================================="
cat antes.txt
echo "==================================================="
echo "==================================================="
echo "||           Despues de la modificacion           ||"
echo "==================================================="
ls -a -l $dir
echo "==================================================="

else
echo "DIRECTORIO INGRESADO NO VALIDO"
fi
else
echo "NO SE PUEDE ASIGNAR CERO SEGUNDOS"
fi

;;
*)
echo "ASIGNACION DE SEGUNDOS INCORRECTA"
;;
esac
