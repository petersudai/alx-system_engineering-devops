#!/usr/bin/env ruby

puts File.readlines(ARGV[0]).map { |line| line.scan(/\[from:([^[\]]+)\] \[to:([^[\]]+)\] \[flags:([^[\]]+)\]/).map { |sender, receiver, flags| "#{sender},#{receiver},#{flags}" } }.join("\n")

