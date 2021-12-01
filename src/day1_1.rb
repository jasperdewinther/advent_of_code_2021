# frozen_string_literal: true

def run(input)
  counter = 0
  (input.length - 1).times do |count|
    counter += 1 if input[count].to_i < input[count + 1].to_i
  end
  counter
end
