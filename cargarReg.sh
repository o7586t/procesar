#!/bin/bash

################################################################################
#
# Descripción
#
################################################################################
#
# Al lanzar este script se introduce en el fichero de trabajo diario un
# registro con el proceso que se debe realizar. Se mete el día, la hora, etc
# si está hecho o no, y al final el contenido del registro.
#
# Debería aparecer un menú que te pregunte si lo que vas a introducir es
# información del día de hoy o de otro día y luego se introduce.
# 
# Si la fecha de lo que se introduce es de esta semana, procesarlo de forma
# normal, si es de otra semana más adelante, calcular el Nº de semana y meter
# la información en la semana correspondiente. 
#
################################################################################ 

###############################################################################
## 
## Variables
## 
###############################################################################

FECHA=`date '+%A'`
FECHA2=`date '+%d%m20%y'`
FECHA3=`date '+%Y-%m-%d - %H:%M:%S'`
METER=`\t[_] 0% $FECHA3 ` 
SEMANAACTUAL=`date '+%V'`
SEMANAFUTURA=""
CAMINO="$HOME/scripts/procesar/"
FICHERO="registro_diario_pruebas.otl"


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

function hoy (){
#1) Preguntar cual es el proceso.
#2) Meter en el fichero la fecha de hoy
#3) Meter en el fichero el proceso

read -p "Introduce tu petición: " PETICION
#echo $METER >> $CAMINO$FICHERO
#printf ${METER}${PETICION} >> $CAMINO$FICHERO
echo -e ${METER}${PETICION} >> $CAMINO$FICHERO
}

function otroDia (){

#1) Preguntar el día a tratar en el proceso.
#2) Investigar a que semana pertenece el día anterior.
#3) Investigar si esta semana ya está en el fichero.
#	3-1) Si no está meterla.
#	3-2) Si ya está buscar en que línea se encuentra el string de la semana y escribir el registro en la línea siguiente.
echo ""

}

function existeSemanaActual(){ # ¿Existe la semana actual grabada en el fichero?

grep -i "# Semana ${SEMANAACTUAL}" $FICHERO 

}

function existeOtraSemana(){ # ¿Existe la semana que nos trata grabada en el fichero?

grep -i "# Semana ${SEMANAFUTURA}" $FICHERO 

}


###########################################################################
###########################################################################
###########################################################################

Menu_meterDatos()
{
echo ""
echo "            ( MENU )"
echo "=================================="
echo "=================================="
echo "1) Introducir peticiones para hoy."
echo "2) Introducir para otro día.      "
echo "=================================="
echo "=================================="
echo ""
echo "0) Salir"
echo ""

read -p "METER OPCIÓN: " answer
case "$answer" in
	1) hoy;;
	2) ./menu/solicitudesOrdenadasSMZV.bash;;
	0) echo "Saliendo del MENU. ";exit;; # salir.
	*) echo "Elección incorrecta.Debe introducir 1 o 2.";
	sleep 1;;
esac
}

DIR=pwd
cd $HOME/scripts

while ((0 == 0))
	do
		Menu_meterDatos
	done

cd $DIR


