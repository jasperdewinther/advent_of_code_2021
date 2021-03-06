# frozen_string_literal: true

def run(input)
  filtered_oxy = input.map(&:clone)
  filtered_co2 = input.map(&:clone)
  oxy = 0
  co2 = 0

  input[0].length.times do |i|
    one_counter_oxy = filtered_oxy.count { |c| c[i] == '1' }
    common_oxy = one_counter_oxy >= filtered_oxy.length.to_f / 2.0
    filtered_oxy = filtered_oxy.select { |v| !common_oxy == v[i].to_i.zero? }
    oxy = filtered_oxy[0].to_i(2)
    break if filtered_oxy.length == 1
  end

  input[0].length.times do |i|
    one_counter_co2 = filtered_co2.count { |c| c[i] == '1' }
    common_co2 = one_counter_co2 >= filtered_co2.length.to_f / 2.0
    filtered_co2 = filtered_co2.select { |v| common_co2 == v[i].to_i.zero?}
    co2 = filtered_co2[0].to_i(2)
    break if filtered_co2.length == 1
  end
  oxy * co2
end
