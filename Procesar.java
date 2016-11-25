/**
 * Write a description of class RegistroDiario here.
 * 
 * @author o7586t 
 * @version 0.1
 * @version 0.2
 * @version 0.3 Hacer los cambios necesarios para poder ordenar los registros
 * en el fichero de texto.
 * @version 0.4 Hacer los cambios necesarios para poder meter más de una sola
 * línea por consola. Estoy atascado. Muy atascado. 2015/10/29.
 * @version 0.5 Ya puede alzar el vuelo, es muy mejorable pero ya lo voy a 
 * colocar en $HOME/bin para empezar a utilizarlo.
 * @version 0.6 Cambiar el formato de la fecha para que se pueda ordenar por
 * orden númerico. Es decir YYYY-MM-DD. Además lo subo a GitHub.
 * @version 0.7 Añadir varias funcionalidades al programa para mejorarlo.
 */

import java.io.*;
import java.util.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Procesar{

/*
 * Clase que detecta si hoy es comienzo de semana, o mejor dicho si es Lunes.
 *
 * Lunes(){
 *
 * 	System.out.println("################################################################################");
 * 	System.out.println("# ");
 * 	System.out.println("# Semana $VARIABLE");
 * 	System.out.println("# ");
 * 	System.out.println("################################################################################");
 *
 *		return true;
 * }
 *
 */

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String str = " ";
		  try{
			//FileWriter flS = new FileWriter("/home/o7586t/Documentos/USB_DISK/trabajo/limpio/Mi_TrabajoDiario/registro_diario.otl", true);					  
         // Directorio de pruebas el directorio local.
			FileWriter flS = new FileWriter("./registro_diario.otl", true);					  
			// Para que se añada la información en el fichero 'registro_diario.otl' hay que ponerle 'true'.
 
			BufferedWriter fs = new BufferedWriter(flS);

			Date date = new Date();
			DateFormat hourdateFormat = new SimpleDateFormat("yyyy-MM-dd - HH:mm:ss ");
         // Semana en número
			// DateFormat semanaFormat = new SimpleDateFormat("yyyy-MM-dd - HH:mm:ss ");
         // 
			System.out.println();
			System.out.println("Hora y fecha: " + hourdateFormat.format(date));
			System.out.println("Introduce el texto. Para terminar un punto único en la línea.");
			System.out.println();

			while (sc.hasNextLine() && !(str = sc.nextLine()).equals(".")) {
				 fs.newLine();
				 fs.write("\t[_] % " + hourdateFormat.format(date) + str);
			} 
			fs.close();
		  }catch(IOException e){
			System.out.println("Ha habido alguna clase de error con el fichero.");
		  }
    }
}
