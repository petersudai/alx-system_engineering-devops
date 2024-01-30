#!/usr/bin/env ruby

string = ARGV[0]

pattern = /\bSchool\b/i

if string =~ pattern
  puts string
end
