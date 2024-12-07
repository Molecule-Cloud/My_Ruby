# frozen_string_literal: true

# Intialize Player Class
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  # Ask the player to make a move
  def make_move(board)
    puts "#{name} Please make a move (1-9)"
    move = gets.chomp.to_i
    until board.valid_move?(move)
      puts 'Invalid move. Try Again'
      move = gets.chomp.to_i
    end
    board.update(move, symbol)
  end
end
