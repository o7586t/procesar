file = File.open("registro_diario_datos.dat")
file.each {|line| 
	expr = /(\[\S*\])--- (\S*)/
	m = expr.match(line)
	print "#{m[0]} --- #{m[1]}\n"
	#print "#{file.lineno}: ", line	
}
file.close

#require "./semana.rb"
#puts " "
