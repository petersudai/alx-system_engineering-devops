#!/usr/bin/env ruby

string = ARGV[0]

matches = string.scan(/[A-Z]/)

puts matches.join
