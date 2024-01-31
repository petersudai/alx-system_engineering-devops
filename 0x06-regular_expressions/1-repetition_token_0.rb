#!/usr/bin/env ruby

string = ARGV[0]

pattern = /hbt{2,5}n/

if string =~ pattern
  puts string
end
