#!/usr/bin/env ruby

log_file = ARGV[0]
text_messages = File.readlines(log_file)

text_messages.each do |line|

  sender = line.match(/\[from:(\+?\w+)\]/)&.captures&.first
  receiver = line.match(/\[to:(\+?\w+)\]/)&.captures&.first
  flags = line.match(/\[flags:(-?\d:-?\d:-?\d:-?\d:-?\d)\]/)&.captures&.first

  puts "#{sender},#{receiver},#{flags}"
end
