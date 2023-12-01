file = File.open('./input.txt', 'r')

data = file.read

groups = data.split(/\n/)

sum = 0

groups.each { |group|
  numbers = group.scan(/\d/)
  puts numbers
  numbers = numbers.map { |x| x.to_i }

  digits = [numbers.first, numbers.last]
  sum += (digits[0] * 10) + digits[1]
}

puts sum
