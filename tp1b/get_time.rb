class Object
  def get_time(filename)
    line_as_array = self.split(" ")                               # splits output into an array by spaces
    line_as_array = line_as_array.reject{ |elem| elem == "ms" }   # removes the "ms" from the array
    
    size = line_as_array.size
    times = []

    times << line_as_array[size-3]                                # 
    times << line_as_array[size-2]                                # fills the variable that will be written
    times << line_as_array[size-1]                                # 

    times.each{ |elem| return if elem == "*" }

    times = times.join(" ")

    if times.length <= 23
      File.open("./results/#{filename}.txt", "a") do |f|                #
        f.write times                                               # writes (appends) the output file
        f.write "\n"                                                #
      end                                                           #
    end
  end

  def get_lines(file, filename)
    file = File.read(file)                                       # loads traceroute file
    file = file.split("\n")
    file.each{ |line| line.get_time(filename) }
  end

end

puts "Ingrese universidad y franja horaria (formato: \"universidad-xxhs\", universidad = california, oxford o tokyo y xx el horario de la franja)"
filename = gets.chomp
get_lines("./tests/tests.txt", filename)