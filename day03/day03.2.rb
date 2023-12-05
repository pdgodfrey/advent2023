file = File.open('./input.txt', 'r')


data = file.read

groups = data.split(/\n/)

sum = 0

max_line_index = groups[0].size - 1

used_identifiers = []

groups.each_with_index { |group, row_index|
  chars = group.chars

  symbol_indexes = []

  chars.each_with_index{|char, index|
    if char =~ /(\*)/
      symbol_indexes << index
    end
  }

  if symbol_indexes.size > 0
    row_indexes = []
    row_indexes << row_index-1 unless row_index == 0
    row_indexes << row_index
    row_indexes << row_index+1 unless row_index == groups.size - 1

    adjacent_nums = []
    adjacent_identifiers = []

    symbol_indexes.each{|index|
      row_indexes.each{|test_index|
        row = groups[test_index]
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

            if !adjacent_identifiers.include?(identifier)
              adjacent_nums << num.join.to_i

              adjacent_identifiers << "#{num.join}:#{test_index}:#{min_range}-#{max_range}"

              # puts "#{test_index} : #{adjacent_identifiers.inspect}"
            end


          end
        }
      }

      if(adjacent_nums.size == 2)
        adjacent_identifiers = adjacent_identifiers.sort
        if(!used_identifiers.include?(adjacent_identifiers))
          used_identifiers << adjacent_identifiers

          gear_ratio = adjacent_nums[0]*adjacent_nums[1]
          # puts gear_ratio

          sum += gear_ratio

        end
      end

      adjacent_identifiers = []
      adjacent_nums = []
    }

  end

}

puts sum
