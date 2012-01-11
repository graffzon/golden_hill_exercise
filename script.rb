class Script

  def reading
    input = File.open("input.txt") {|file| file.read}
    i = 0
    input_array = []
    input.split("\n").each do |str| 
      input_array[i] = str.split(' ').collect! {|c| c.to_i}
      i += 1
    end
    input_array
  end

  def make_path(hill)
    path = [0]
    y = 1
    path << hill[y].index(hill[y].max)

    y = 2
    while y < hill.count do
      path << hill[y].index([hill[y][path[y-1]],hill[y][path[y-1]+1]].max)
      y += 1
    end
    path
  end

  def calculating
    hill_array = reading
    x = y = hill_array.count - 1

    while x != 0 || y != 0 do
      hill_array[y-1][x-1] =
        hill_array[y-1][x-1] +
          [hill_array[y][x], hill_array[y][x-1]].max unless x.zero?

      x = x.zero? ? y = y - 1 : x - 1
    end

    puts "Max sum: #{hill_array[0][0]}"
    puts "Indexes of optimal path:"
    p make_path(hill_array)
  end

  def initialize
    calculating
  end

end

Script.new