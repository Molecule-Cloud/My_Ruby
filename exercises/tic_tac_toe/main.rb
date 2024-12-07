# frozen_string_literal: true

require_relative 'game'

# Start the game
def main
  game = Game.new
  game.play
end
main
