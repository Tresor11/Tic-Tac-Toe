#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './../lib/logic.rb'

name1=nil
name2=nil
begin
  puts 'Player 1, enter your name:'
  name1 = gets.chomp
  puts "please enter a valid name!!" if name1.length < 2
  puts `clear`
  puts 'Player 2, enter your name:'
  name2 = gets.chomp
  puts "please enter a valid name!!" if name2.length < 2
  puts `clear`
rescue StandardError => e
  puts "Invalid name given #{e}"
  sleep 1
  retry
end

main=UI.new(name1,name2)
main.game