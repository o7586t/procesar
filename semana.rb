require "date"

t1 = Time.local(2016,8,15) # 1 de mayo de 2014
week = t1.strftime("%W").to_i
print "Estamos en la semana: " + week.to_s

puts " "

t = Time.now
puts t.strftime("%d/%m/%Y %H:%M:%S")
# strftime - formatear tiempo (stringfy time)
# %d - día (day)
# %m - mes (month)
# %Y - año (year)
# %H - hora en formato 24 horas (hour)
# %M - minuto
# %S - segundo (second)
 
puts t.strftime("%A")
puts t.strftime("%B")
# %A - día de la semana
# %B - mes del año
 
puts t.strftime("son las %H:%M %Z")
# %Z - zona horaria