file = File.open('./input.txt', 'r')


data = file.read

groups = data.split(/\n/)

def convert_numbers_to_int_array(input)
  return input.split(/\s/).delete_if{|x| x.strip == ""}.map{|x| x.strip.to_i }
end

card_nums_winners = {

}

total_used_cards = {

}

groups.each { |group|
  card_num = group.gsub(/.*?(\d+):.*/, '\1').to_i
  winning_numbers = group.gsub(/.*?:\s(.*?)\s\|.*/, '\1')
  card_numbers = group.gsub(/.*?\|\s(.*)/, '\1')

  winning_numbers = convert_numbers_to_int_array(winning_numbers)

  card_numbers = convert_numbers_to_int_array(card_numbers)

  total_winners = 0

  card_numbers.each{|cn|
    if winning_numbers.include?(cn)
      total_winners += 1
    end
  }

  card_nums_winners[card_num] = total_winners

  total_used_cards[card_num] = 1

}

total_used_cards.each do |card_num, total_items|
  total_winners = card_nums_winners[card_num]
  if total_winners > 0
    (1..total_items).each{|x|
      (1..total_winners).each{|i|
        total_used_cards[card_num+i] += 1
      }
    }
  end
end


total_cards = total_used_cards.map{|k,v| v }

puts total_cards.sum