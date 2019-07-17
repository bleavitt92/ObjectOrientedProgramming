class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play here
  end
  def play
    "In the bingo game now!"
  end
end

# adding a play method to the class Bingo changes what happens when play is called on Bingo. Before, it would have said "Start the game!", now, the method lookup path will stop when it gets the the method named play within the Bingo class and it will return "In the bingo game now!"

p Bingo.new.play
p Game.new.play