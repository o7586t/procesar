#!/home/o7586t/.rvm/rubies/ruby-2.4.0/bin/ruby
=begin
Lo primero que debo hacer es leer los ficheros, tanto el de registro_diario_datos de todos los d�as, como el de procesar con los datos diarios.
Parece lo mismo pero no lo es.
=end

File.open("registro_diario_datos.dat") do |fileIn|
	while record = fileIn.gets
		puts record
		array = record
	end
	print array
end

=begin
Voy a seguir con otra estrategia diferente. Abrimos un fichero y prcesamos cada l�nea como un arreglo.
=end

archivo = "registro_diario_datos.dat"

f = File.open(archivo)
	f.each do |line|
		puts "#{f.lineno}: #{line}"

		p f.size
		p f.to_a
end
