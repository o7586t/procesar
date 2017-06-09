#!/bin/bash

################################################################################
#
# Descripción
#
################################################################################
#
# Al lanzar este script se inicializa el día de trabajo cargando las acciones
# del fichero registro_diario_datos.dat en el fichero de trabajo diario
# registro_diario.otl.
#
################################################################################ 

#####
## Variables
####

FECHA=`date '+%A'`
FECHA2=`date '+%d%m20%y'`
FECHA3=`date '+%Y-%m-%d - %H:%M:%S'`
METER="\t[_] 0% $FECHA3 " 

#####
## Funciones
#####

function separador (){
   echo " "
   echo "======================================================================"
   echo "======================================================================"
   echo "======================================================================"
   echo " "
}

#####
## 
## El primer grep extrae los registros que contienen la etiqueta "todos" y los
## pone en el fichero de trabajo.
## El segundo grep extrae todos los registros que contiene la etiqueta del día
## corriente en el que nos encontramos y los pone en el fichero de trabajo.
## El primer sed hace limpieza de los registros y les quita todo aquello que no
## deberían tener.
## El segundo 'sed' coloca al principio de cada registro del fichero la
## información que debería contener. Esta está en el formato 'otl' y es un
## tabulador seguido de una fecha y de la hora y minuto en la que se crea el
## ticket.
## 
#####

grep -i "todos" registro_diario_datos.dat >> ../../tmp/meterlo.txt
grep -i $FECHA registro_diario_datos.dat >> ../../tmp/meterlo.txt
sed -i s/\\[.*\\]---" "//g ../../tmp/meterlo.txt
sed -i s/^/"\t"[_]" "0%" $FECHA3 "/g ../../tmp/meterlo.txt

#####
##
## Debería meter el directorio de trabajo en un 'tmp'.
##
#####

cat ../../tmp/meterlo.txt >> ./registro_diario.otl
rm ../../tmp/meterlo.txt

#####
##
## Sacar algo de informacíon por la pantalla.
##
#####

separador

echo ""
echo " Introduciendo información en el fichero del registro diario."
echo " Hoy estamos a: $FECHA2"
echo ""

