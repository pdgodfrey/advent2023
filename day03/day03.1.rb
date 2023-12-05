file = File.open('./input.txt', 'r')


data = file.read

groups = data.split(/\n/)

sum = 0

# puts groups

max_row_index = groups.size - 1
max_line_index = groups[0].size - 1

used_nums = []

groups.each_with_index { |group, row_index|
  # puts "==============="
  chars = group.chars

  symbol_indexes = []

  chars.each_with_index{|char, index|
    if char =~ /([^a-zA-Z0-9\.])/
      symbol_indexes << index
    end
  }

  if symbol_indexes.size > 0
    row_indexes = []
    row_indexes << row_index-1 unless row_index == 0
    row_indexes << row_index
    row_indexes << row_index+1 unless row_index == groups.size - 1

    row_indexes.each{|test_index|
      row = groups[test_index]
      symbol_indexes.each{|index|
        start_index = index == 0 ? 0 : index - 1
        end_index = index == max_line_index ? max_line_index : index + 1

        (start_index..end_index).each{|char_index|
          if row[char_index] =~ /\d/
            found_index = char_index

            num = [row[char_index]]
            char_index +=1
            while char_index <= max_line_index && row[char_index] =~ /\d/
              num << row[char_index]
              char_index += 1
            end
            max_range = char_index - 1
            char_index = found_index - 1
            while char_index >= 0 && row[char_index] =~ /\d/
              num.unshift(row[char_index])
              char_index -= 1
            end
            min_range = char_index + 1

            identifier = "#{num.join}:#{test_index}:#{min_range}-#{max_range}"


            if !used_nums.include?(identifier)
              used_nums << identifier
            end
          end
        }
      }
    }

  end

}

used_nums.each do |num|
  numStr = num.gsub(/(\d+):.*/, '\1')

  sum += numStr.to_i
end

puts sum
