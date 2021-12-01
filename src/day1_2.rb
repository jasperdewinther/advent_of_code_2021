# frozen_string_literal: true

def run(input)
  counter = 0
  (input.length - 3).times do |count|
    counter += 1 if input[count, 3].map!(&:to_i).sum < input[count + 1, 3].map(&:to_i).sum
  end
  counter
end
