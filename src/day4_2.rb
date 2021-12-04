# frozen_string_literal: true

def run(input)
  numbers = input[0].split(',')
  boards = []
  (2..input.length).step(6).each do |index|
    map = input[index, 5].reduce{ |a,b| a + " " + b}.split
    boards.append map
  end

  last_num = nil
  last_board = nil
  won = Array.new(boards.length) {|i| false }

  numbers.each do |num|
    last_num = num
    boards.length.times do |index|
      next if won[index] == true
      last_board = index

      found_index = boards[index].index(num)
      unless found_index.nil?
        boards[index][found_index] = "x"
      end

      wins = false
      5.times.each do |row|
        counter = 0
        5.times do |column|
          counter+=1 if boards[index][row + 5*column] == "x"
        end
        if counter == 5
          wins = true
        end
      end

      5.times do |column|
        counter = 0
        5.times do |row|
          counter+=1 if boards[index][row + 5*column] == "x"
        end
        if counter == 5
          wins = true
        end
      end
      won[index] = wins
    end
    break if won.count(false) == 0
  end


  summed = 0
  5.times do |column|
    5.times do |row|
      summed+=boards[last_board][row + 5*column].to_i if boards[last_board][row + 5*column] != "x"
    end
  end
  summed * last_num.to_i
end
