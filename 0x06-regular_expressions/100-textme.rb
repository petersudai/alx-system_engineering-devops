#!/usr/bin/env ruby

log_file = ARGV[0]

File.open(log_file, 'r').each_line do |line|
  sender = line.match(/\[from:(\+?\w+)\]/)&.captures&.first
  receiver = line.match(/\[to:(\+?\w+)\]/)&.captures&.first
  flags = line.match(/\[flags:(-?\d:-?\d:-?\d:-?\d:-?\d)\]/)&.captures&.first

  puts "#{sender},#{receiver},#{flags}" if sender && receiver && flags
end
