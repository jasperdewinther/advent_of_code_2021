# frozen_string_literal: true

Dir['./*'].sort.each do |file|
  next unless file.end_with?('.rb') && file.start_with?('./day')

  require file
  input_text = File.read("../input/#{file[2..-4]}.txt").split
  timer_start = Time.now
  result = run input_text
  timer_end = Time.now
  puts "problem: #{file[2..-4]} found result #{result} in #{timer_end-timer_start} seconds"
end
