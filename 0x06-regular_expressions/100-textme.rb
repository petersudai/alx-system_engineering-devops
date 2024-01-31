#!/usr/bin/env ruby

log_File = ARGV[0]

File.open(log_file, 'r').each_line do |line|
  sender = line.match(/\[from:([^[\]]+)\]/)&.captures&.first
  receiver = line.match(/\[to:([^[\]]+)\]/)&.captures&.first
  flags = line.match(/\[flags:([^[\]]+)\]/)&.captures&.first

  puts "#{sender},#{receiver},#{flags}" if sender && receiver && flags
end
