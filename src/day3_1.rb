# frozen_string_literal: true

def run(input)
  one_counter = Array.new(input[0].length){|| 0}
  input.each do |line|
    line.length.times do |count|
      one_counter[count] += 1 if line[count] == '1'
    end
  end
  gamma = 0
  epsilon = 0
  one_counter.length.times do |counter|
    gamma = (gamma << 1) ^ 1 if one_counter[counter] > input.length / 2
    gamma = (gamma << 1) if one_counter[counter] <= input.length / 2
    epsilon = (epsilon << 1) ^ 1 if one_counter[counter] < input.length / 2
    epsilon = (epsilon << 1) if one_counter[counter] >= input.length / 2
  end
  gamma * epsilon
end
