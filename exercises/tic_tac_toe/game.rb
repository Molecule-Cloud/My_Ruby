# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Main Game
class Game
  def initialize
    create_players
    create_board
    @game_over = false
  end

  # Main Game Loop
  def play
    until @game_over
      @board.display
      current_player.make_move(@board)
      if @board.check_winner
        @board.display
        puts "#{current_player.name} Wins!"
        @game_over = true
        @board.display
      elsif @board.full?
        @board.display
        puts 'The Game is a Tie'
        @game_over = true
      else
        switch_turns
      end
    end
    play_again?
  end

  # Play Again
  def play_again?
    puts 'Would you like to play again? Press Y for Yes, N for No'
    answer = gets.chomp.downcase
    if answer == 'y'
      @game_over = false
      main
    else
      puts 'Good Game'
      @game_over = true
    end
  end

  private

  # Create Players
  def create_players
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @players = [@player1, @player2]
    @current_player_index = 0
  end

  #  Create_board
  def create_board
    @board = Board.new
  end

  #  Switch_Turns
  def switch_turns
    @current_player_index = (@current_player_index + 1) % 2
  end

  # Current_Player_Turn
  def current_player
    @players[@current_player_index]
  end
end
