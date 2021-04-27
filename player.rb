class Player
  attr_accessor :name, :lives, :answer

  def initialize(name)
    @name = name
    @lives = 3
  end

  def solution
    @answer = answer
  end

  def remove_life
    @lives -= 1
  end
end