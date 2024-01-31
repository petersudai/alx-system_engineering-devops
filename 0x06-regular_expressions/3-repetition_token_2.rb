#!/usr/bin/env ruby

string = ARGV[0]

pattern = /hbt+n/

if string =~ pattern
  puts string
end
