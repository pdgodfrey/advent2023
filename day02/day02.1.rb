file = File.open('./input.txt', 'r')


data = file.read

groups = data.split(/\n/)

sum = 0

max_red = 12
max_green = 13
max_blue = 14

max_colors = {
  "red" => 12,
  "green" => 13,
  "blue" => 14
}

groups.each { |group|
  game_number = group.gsub(/.*?(\d+):.*/, '\1').to_i
  group = group.gsub(/.*?:\s(.*)/, '\1')

  color_groups = group.scan(/(\d+\s\w+)/).flatten

  is_possible = true

  color_groups.each { |color_group|
    number, color = color_group.split(/\s/)
    number = number.to_i

    if number > max_colors[color]
      is_possible = false
      break
    end
  }

  if is_possible
    sum += game_number
  end
}

puts sum
