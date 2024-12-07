# frozen_string_literal: true

# Intitalizing the board
class Board
  def initialize
    @grid = Array.new(9, ' ')
  end

  # Display the board
  def display
    puts "#{@grid[0]} | #{@grid[1]} | #{@grid[2]}"
    puts '--+---+--'
    puts "#{@grid[3]} | #{@grid[4]} | #{@grid[5]}"
    puts '--+---+--'
    puts "#{@grid[6]} | #{@grid[7]} | #{@grid[8]}"
  end

  # Check for a valid move
  def valid_move?(move)
    move.between?(1, 9) && @grid[move - 1] == ' '
  end

  # Update the board
  def update(move, symbol)
    @grid[move - 1] = symbol
  end

  # Check for the winner
  def check_winner
    win_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
    # loop through to check for matching combinations in rows, column and diagonally
    win_combinations.any? do |combination|
      @grid[combination[0]] == @grid[combination[1]] &&
        @grid[combination[1]] == @grid[combination[2]] &&
        @grid[combination[2]] != ' '
    end
  end

  # Check if the board is full
  def full?
    !@grid.include?(' ')
  end
end
