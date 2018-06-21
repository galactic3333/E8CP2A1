puts "\n\tEVALUACIONES ALUMNOS"
puts "\n\tIngresa una opción:"
puts "1\tGenerar un archivo con el nombre de cada alumno y su promedio"
puts "2\tMostrar la cantidad de inasistencias totales"
puts "3\tMostrar los alumnos aprobados"
puts "4\tSalir"

option = gets.chomp

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

while option != '4'

  def gen_average(arg)
    file = File.open(arg, 'r')
    alumnos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close

    print alumnos

    notas = alumnos.map { |array| array.map { |x| x.to_i if x.is_integer? } }
    print notas

    solonotas = notas.map(&:compact)

    print solonotas

    soloalumnos = alumnos.map { |lista| lista[0] }
    print soloalumnos

    promedio = solonotas.map{ |notasalum| notasalum.inject { |sum, x| sum + x} / notasalum.length.to_f }

    print promedio

    alumno_promedio = soloalumnos.zip(promedio).to_h

    print alumno_promedio

    file = File.open('promedio_alumnos.txt', 'w')

    alumno_promedio.each { |key,value| file.puts "#{key} #{value}"}

    file.close
  end

  def no_attendance(arg)
    file = File.open(arg, 'r')
    alumnos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close

    print alumnos

    soloalumnos = alumnos.map { |lista| lista[0] }
    print soloalumnos

    notasyausente = alumnos.each { |lista| lista.delete_at(0) }
    print notasyausente

    soloa = notasyausente.map { |lista| lista.map { |x| x if x == 'A' } }

    print soloa

    ausente = soloa.map(&:compact)

    print ausente

    numaus = ausente.map{ |lista| lista.inject(0) { |sum, x| sum + 1 if x == 'A'} }

    print numaus

    totaus = numaus.inject(0) { |sum, x| sum + x}

    print totaus
    alumno_ausente = soloalumnos.zip(numaus).to_h

    print alumno_ausente

    puts "\n\nLa cantidad de Insistencias totales del curso es #{totaus} inasistencias"
    puts 'El detalle de inasistencias por alumno es el siguiente:'
    alumno_ausente.each{ |key, value| print "\n#{key}: #{value} inasistencias"}

  end

  def approved(arg, arg2)

    file = File.open(arg, 'r')
    alumnos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close

    print alumnos

    soloalumnos = alumnos.map { |lista| lista[0] }
    print soloalumnos

    notasyausente = alumnos.each { |lista| lista.delete_at(0) }
    print notasyausente

    notas = notasyausente.map { |array| array.map { |x| x.to_i if x.is_integer? } }
    print notas

    solonotas = notas.map(&:compact)

    print solonotas



    promedio = solonotas.map{ |notasalum| notasalum.inject { |sum, x| sum + x} / notasyausente.length.to_f }

    print promedio

    alumno_promedio = soloalumnos.zip(promedio).to_h

    print alumno_promedio

    alumno_promedio.each { |key, value| puts "#{key} esta aprobado con nota #{value}" if value >= arg2 }

  end



  case option

  when '1'
    gen_average('alumnos.csv')
  when '2'
    no_attendance('alumnos.csv')
  when '3'
    approved('alumnos.csv',5)
  end

  validoption = ['1', '2', '3', '4']

  if validoption.include?(option)
  else
    puts 'La opción ingresada no es válida!'
  end

  puts "\n\n\tEVALUACIONES ALUMNOS"
  puts "\n\tIngresa una opción:"
  puts "1\tGenerar un archivo con el nombre de cada alumno y su promedio"
  puts "2\tMostrar la cantidad de inasistencias totales"
  puts "3\tMostrar los alumnos aprobados"
  puts "4\tSalir"

  option = gets.chomp



end
