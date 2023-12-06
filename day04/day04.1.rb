file = File.open('./input.txt', 'r')


data = file.read

groups = data.split(/\n/)

sum = 0

def convert_numbers_to_int_array(input)
  return input.split(/\s/).delete_if{|x| x.strip == ""}.map{|x| x.strip.to_i }
end

groups.each { |group|
  winning_numbers = group.gsub(/.*?:\s(.*?)\s\|.*/, '\1')
  card_numbers = group.gsub(/.*?\|\s(.*)/, '\1')

  winning_numbers = convert_numbers_to_int_array(winning_numbers)

  card_numbers = convert_numbers_to_int_array(card_numbers)

  points = 0

  card_numbers.each{|cn|
    if winning_numbers.include?(cn)
      if points == 0
        points += 1
      else
        points = points * 2
      end
    end
  }

  sum += points

}

puts sum
