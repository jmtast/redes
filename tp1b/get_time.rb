class Object
  def get_time
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
      File.open("./results/results.txt", "a") do |f|                #
        f.write times                                               # writes (appends) the output file
        f.write "\n"                                                #
      end                                                           #
    end
  end

  def get_lines(file)
    file = File.read(file)                                       # loads traceroute file
    file = file.split("\n")
    file.each{ |line| line.get_time() }
  end

end

get_lines("./tests/tests.txt")