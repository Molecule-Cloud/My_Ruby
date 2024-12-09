#   Game Class
class Game
  def setup(player, computer, secret_code, left_turn, role)
    @player = player
    @computer = computer
    @secret_code = secret_code
    @left_turn = left_turn
    @role = role
  end

  #   Initialize method. Overides the parameterized initialize method above
  def initialize
    puts 'Do you want to be the guesser or the creator?'
    @role = gets.chomp.downcase
    create_players
    start_game
  end

  # Create Players
  def create_players
    if @role == 'guesser'
      @player = Player.new('Guesser')
      @computer = Computer.new('Creator')
    else
      @player = Player.new('Creator')
      @computer = Computer.new('Guesser')
    end
  end

  #   Start Game
  def start_game
    @left_turn = 12
    if @role == 'guesser'
      play_as_guesser
    else
      play_as_creator
    end
  end

  #   Play as Guesser
  def play_as_guesser
    @secret_code = @computer.generate_code
    while @left_turn.positive?
      puts "Turn number: #{@left_turn}"
      guess = @player.make_guess
      feedback = provide_feedback(guess)
      puts "Feedback: #{feedback[:correct_positions]} correct positions, #{feedback[:correct_colors]} correct colors"
      if feedback[:correct_positions] == 4
        puts 'You Win!'
        return
      end
      @left_turn -= 1
    end
    puts "You lose! The secret code was #{@secret_code.join(', ')}"
    play_again?
  end

  # Creator Method

  def play_as_creator
    @secret_code = @player.create_code
    while @left_turn.positive?
      puts "Turn number: #{@left_turn}"
      guess = @computer.make_guess
      puts "Computer's guess: #{guess.join(', ')}"
      feedback = provide_feedback(guess)
      puts "Feedback: #{feedback[:correct_positions]} correct positions, #{feedback[:correct_positions]} correct_colors"
      if feedback[:correct_positions] == 4
        puts 'Computer Wins!'
        return
      end
      @left_turn -= 1
    end
    puts "Computer loses! The secret code was #{@secret_code}"
    play_again?
  end

  # Feedback Method
  def provide_feedback(guess)
    correct_positions = 0
    correct_colors = 0
    guess.each_with_index do |_color, index|
      if guess[index] == @secret_code[index]
        correct_positions += 1
      elsif @secret_code.include?(guess[index])
        correct_colors += 1
      end
    end
    { correct_positions: correct_positions, correct_colors: correct_colors }
  end

  def play_again?
    puts 'Would you like to play again? Press Y for Yes, N for No'
    answer = gets.chomp.downcase
    if answer == 'y'
      start_game
    else
      puts 'Thanks for playing!'
    end
  end
end
