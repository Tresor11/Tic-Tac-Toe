# frozen_string_literal: true

require_relative './logic.rb'

class UI
  def initialize(first, second)
    @first = first
    @second = second
    @run = Logic.new(@first, @second)
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
    puts 'Its a tie' unless win
    puts "Congrats! The winner is #{@run.current_player}!" if win
    begin
      puts 'Would like to play again? (y/n)'
      ans = gets.chomp
    rescue StandardError
      puts 'Ooops there was an error!'
    end
    if ans.to_sym == :y
      @run.play_again
      return game
    elsif ans.to_sym == :n
      puts 'See you later'
    else
      puts 'Invalid option!!!!! come back anytime :)'
    end
  end
end
