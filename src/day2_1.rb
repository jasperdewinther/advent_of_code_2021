# frozen_string_literal: true

def run(input)
  depth = 0
  horizontal = 0
  input.each do |line|
    depth += line[-1].to_i if line[0, 4] == 'down'
    depth -= line[-1].to_i if line[0, 2] == 'up'
    horizontal += line[-1].to_i if line[0, 7] == 'forward'
  end
  depth * horizontal
end
