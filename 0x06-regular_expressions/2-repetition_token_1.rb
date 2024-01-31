#!/usr/bin/env ruby

string = ARGV[0]

pattern = /hb?tn/

if string =~ pattern
  puts string
end
