#!/usr/bin/env ruby

string = ARGV[0]

pattern = /School/

if string =~ pattern
  puts string
end
