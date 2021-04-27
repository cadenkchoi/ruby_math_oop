class Game
  attr_accessor :game_on, :current_player, :answer, :player

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @game_on = true
    @current_player = @player_1
    puts "LET'S PLAY!"
  end

  def start_game
    while @game_on
      self.new_question
      self.get_answer
      self.check_answer
      self.check_lives
    end
  end

  def new_question
    first_number = rand(1..20)
    second_number = rand(1..20)
    puts "\n#{@current_player.name}: What does #{first_number} + #{second_number} equal?"
    @answer = first_number + second_number
  end

  def get_answer
    @current_player.answer = gets.chomp.to_i
  end

  def check_answer
    if @current_player.answer == @answer
      puts "\nCorrect! Keep your lives!"
      self.change_player
    else 
      puts "\nWrong, the answer was #{@answer}, you lose a life!"
      @current_player.lives -= 1
      self.change_player
    end
    puts "\nPlayer 1: #{@player_1.lives}/3 vs. Player 2: #{@player_2.lives}/3"
    puts "\n*** NEXT TURN ***"
  end

  def check_lives 
    if @player_1.lives == 0 || @player_2.lives == 0
      self.game_over
    end
  end

  def change_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def game_over
    @game_on = false
    message = @player_1.lives == 0 ? "\n#{@player_2} wins with a score of #{@player_2.lives}/3" : "#{@player_1} wins with a score of #{@player_1.lives}/3"
    puts message
    puts "\n*** GAME OVER :( ***"
    puts "*** PLAY AGAIN? :) ***"
  end
end