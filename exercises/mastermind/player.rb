# Player Class
class Player
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def make_guess
    puts 'Enter your guess (4 colors separated by spaces): '
    gets.chomp.split.map(&:downcase)
  end

  def create_code
    puts 'Create your secret code (4 colors separated by spaces): '
    gets.chomp.split.map(&:downcase)
  end
end
