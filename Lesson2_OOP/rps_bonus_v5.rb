WINNING_SCORE = 10
COMPUTER_NAMES = ['r2d2', 'c3po', 'yoda', 'darth vader', 'bb-8']

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  WINNING_MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['paper', 'spock'],
    'spock' => ['rock', 'scissors']
  }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_MOVES[value].include?(other_move.value)
  end

  def <(other_move)
    WINNING_MOVES[other_move.value].include?(value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    @score = 0
    @move_history = []
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    n = ''
    loop do
      puts "Choose an opponent: #{COMPUTER_NAMES}"
      n = gets.chomp
      break if COMPUTER_NAMES.include?(n.downcase)
      puts "Sorry, must enter a valid name from the options."
    end
    self.name = n
  end
end

# R2D2 always chooses lizard
class R2D2 < Computer
  def initialize
    super
    @name = 'R2D2'
  end

  def choose
    self.move = Move.new('lizard')
  end
end

# C3PO chooses a random move from either rock, paper, or scissors
class C3PO < Computer
  def initialize
    super
    @name = 'C3PO'
  end

  def choose
    self.move = Move.new(Move::VALUES[0..2].sample)
  end
end

# Yoda chooses the values in order: rock, paper, scissors, lizard, spock
class Yoda < Computer
  def initialize
    super
    @name = 'Yoda'
    @counter = 0
  end

  def choose
    self.move = Move.new(Move::VALUES[@counter])
    @counter +=1
  end
end

# Darth_Vader will choose a random value first then whatever you last chose
class Darth_Vader < Computer
  def initialize
    super
    @name = 'Darth Vader'
  end

  def choose
    if move_history.empty?
      self.move = Move.new(Move::VALUES.sample)
    else
      puts "The history is #{move_history}"
      self.move = Move.new(Move::VALUES.sample)
    end
  end
end

class BB_8 < Computer
  def initialize
    super
    @name = 'BB-8'
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def set_computer
    case computer.set_name
    when 'r2d2' then @computer = R2D2.new
    when 'c3po' then @computer = C3PO.new
    when 'yoda' then @computer = Yoda.new
    when 'darth vader' then @computer = Darth_Vader.new
    when 'bb-8' then @computer = BB_8.new
    end
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move} and #{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
    puts "Score: #{human.name}:#{human.score}  #{computer.name}:#{computer.score}"
  end
  
  def winner
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def play_again?
    answer = nil
    if human.score == WINNING_SCORE || computer.score == WINNING_SCORE
      puts "#{winner.name} won by making it to #{WINNING_SCORE} first!"
      return false
    end

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end
  
  def increment_score(player)
    player.score +=1 unless player.nil?
  end
  
  def add_move_to_history(player)
    player.move_history << player.move 
  end
  
  def print_history(player)
    player.move_history.each_with_index do |move, index|
      puts "Turn ##{index+1}: #{move}"
    end
  end

  def play
    display_welcome_message
    human.set_name
    set_computer

    loop do
      human.choose
      add_move_to_history(human)
      computer.choose
      add_move_to_history(computer)
      display_moves
      increment_score(winner)
      display_winner
      break unless play_again?
    end

    puts "Your moves:"
    print_history(human)
    puts "#{computer.name}'s moves:"
    print_history(computer)
    display_goodbye_message
  end
end

RPSGame.new.play