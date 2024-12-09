# Computer Moves
class Computer
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def generate_code
    colors = %w[red blue green yellow orange purple white black]
    Array.new(4) { colors.sample }
  end

  def make_guess
    colors = %w[red blue green yellow orange purple white black]
    Array.new(4) { colors.sample }
  end
end
