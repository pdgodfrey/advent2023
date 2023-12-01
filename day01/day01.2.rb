file = File.open('./input.txt', 'r')
# file = File.open('./test_input2.txt', 'r')

data = file.read

groups = data.split(/\n/)

sum = 0

@string_ints = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}

def convert_numstr_to_int(input)
  if @string_ints.keys.include?(input)
    return @string_ints[input]
  else
    return input.to_i
  end

end

groups.each { |group|
  first_num = group.scan(/(\d|one|two|three|four|five|six|seven|eight|nine)/).flatten.first
  second_num = group.reverse.scan(/(\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)/).flatten.first.reverse

  first_num = convert_numstr_to_int(first_num)
  second_num = convert_numstr_to_int(second_num)

  sum += (first_num * 10) + second_num
}

puts sum
