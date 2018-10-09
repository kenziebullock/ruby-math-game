class Player

  attr_accessor :name, :score

  def initialize(num)
    @name = "Player #{num}"
    @score = 3
  end
  
  def if_wrong
    @score -= 1
  end

end