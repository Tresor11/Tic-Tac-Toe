# frozen_string_literal: true

class Logic
  attr_reader :board, :play, :player1, :player2, :turn
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @play = true
    @turn = true
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def move(num)
    if num.positive? && num <= 9 && @board[num - 1].is_a?(Integer)
      @board[num - 1] = @turn ? 'X' : 'O'
      return true
    end
    false
  end

  def game_end
    if victory1 || victory2
      @play = false
      true
    elsif @board.none?(Integer)
      @play = false
      false
    else
      @turn = !@turn
      -1
    end
  end

  def victory1
    (0..2).each do |i|
      if ((@board[i * 3] == @board[(i * 3) + 1]) &&
         (@board[i * 3] == @board[(i * 3) + 2])) ||
         ((@board[i] == @board[i + 3]) &&
         (@board[i] == @board[i + 6]))
        return true
      end
    end
    false
  end

  def victory2
    if ((@board[0] == @board[4]) &&
       (@board[0] == @board[8])) ||
       ((@board[2] == @board[4]) &&
       (@board[2] == @board[6]))
      true
    else
      false
    end
  end

  def current_player
    @turn ? @player1 : @player2
  end

  def play_again
    @turn = true
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @play = true
  end
end

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
