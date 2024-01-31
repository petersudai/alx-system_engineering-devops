#!/usr/bin/env ruby

string = ARGV[0]

pattern = /hb*t+n/

if string =~ pattern
  puts string
end
