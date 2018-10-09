class Game

  # attr_accessor :p1, :p2, :turn
  attr_accessor :turn

  def initialize
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    @turn = @p1
  end

  def start
    puts "\nNew game! \n#{@p1.name}: #{@p1.score}/3 vs #{@p2.name}: #{@p2.score}/3"
    new_turn
  end

  def new_turn
    puts "\n----- NEW TURN -----"
    if question == false
      turn.if_wrong
    end
    
    turn_check
    check_scores
  end 

  def question
    x = rand(10)
    y = rand(10)
    z = x + y
    puts "#{turn.name}: What is #{x} + #{y}?"
    ans = gets.chomp.to_i
    if ans == z
      puts "#{turn.name}: Correct! Good job!"
      true
    else
      puts "That is wrong...."
      false
    end
  end

  def turn_check
    if turn == @p1
      @turn = @p2
    else
      @turn = @p1
    end
  end

  def game_over
    if @p1.score == 0
      winner = @p2
    else
      winner = @p1
    end
    puts "#{winner.name} wins with a score of #{winner.score}/3\n----- GAME OVER -----\nGood bye!"
  end

  def check_scores
    if @p1.score <= 0 || @p2.score <= 0
      game_over
    else
      puts "#{@p1.name}: #{@p1.score}/3 vs #{@p2.name}: #{@p2.score}/3"
      new_turn
    end
  end

end
