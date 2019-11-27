#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './../lib/logic.rb'

class UI
  def initialize
    players = [0, 0]
    begin
      puts 'Player 1, enter your name:'
      players[0] = gets.chomp
      puts "please enter a valid name!!" if players[0].length < 2
      puts `clear`
      puts 'Player 2, enter your name:'
      players[1] = gets.chomp
      puts "please enter a valid name!!" if players[1].length < 2
      puts `clear`
    rescue StandardError => e
      puts "Invalid name given #{e}"
      sleep 1
      retry
    end
    @run = Logic.new(players[0], players[1])
  end

  def game
    interface
    while @run.play
      puts "please #{@run.current_player} make a move"
      until @run.move(gets.chomp.to_i)
        puts "please #{@run.current_player} make a move for a available post"
      end
      interface
      @win = @run.game_end
    end
    done(@win)
  end

  def interface
    puts `clear`
    puts '=============================='
    3.times do |x|
      puts "        #{@run.board[x * 3]}   #{@run.board[(x * 3) + 1]}   #{@run.board[(x * 3) + 2]}    "
    end
    puts '=============================='
  end

  def done(win)
    puts "Its a tie" unless @run.game_end
    puts "Congrats! The winner is #{@run.current_player}!" if @run.game_end
    begin
    puts "Would like to play again? (y/n)"
    ans=gets.chomp
    rescue Exception
      puts "Ooops there was an error!"
    end
      if ans.to_sym== :y
        @run.play_again
        return game
      elsif ans.to_sym== :n
         puts "See you later"
      else
        puts "Invalid option!!!!! come back anytime :)"
      end
  end
end

main=UI.new
main.game