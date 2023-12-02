file = File.open('./input.txt', 'r')


data = file.read

groups = data.split(/\n/)

sum = 0


groups.each { |group|
  color_maxes = {
    "red" => 0,
    "green" => 0,
    "blue" => 0
  }

  game_number = group.gsub(/.*?(\d+):.*/, '\1').to_i
  group = group.gsub(/.*?:\s(.*)/, '\1')

  color_groups = group.scan(/(\d+\s\w+)/).flatten

  color_groups.each { |color_group|
    number, color = color_group.split(/\s/)
    number = number.to_i

    current_highest = color_maxes[color]

    if number > current_highest
      color_maxes[color] = number
    end

  }

  sum += (color_maxes["red"] * color_maxes["green"] * color_maxes["blue"])
}

puts sum
