#!/usr/bin/env ruby

string = ARGV[0]

pattern = /^h.n$/

if string =~ pattern
  puts string
end
