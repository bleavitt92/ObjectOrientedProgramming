WINNING_SCORE = 2
COMPUTER_NAMES = ['r2d2', 'c3po', 'yoda', 'darth vader', 'bb-8']
VALUES = {
    'r'=> 'rock', 
    'p'=> 'paper',
    's'=> 'scissors',
    'l'=> 'lizard',
    'sp'=> 'spock'
  }

module PROMPTING
  def prompt(msg)
    puts "=> #{msg}"
  end
end

class Move
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
  include PROMPTING

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
      prompt "Hello! What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      prompt "Please choose (r)ock, (p)aper, (s)cissors, (l)izard, or (sp)ock:"
      choice = gets.chomp
      break if VALUES.keys.include? choice
      prompt "Sorry, invalid choice."
    end
    self.move = Move.new(VALUES[choice])
  end
end

class Computer < Player
  def set_name
    n = ''
    loop do
      prompt "Choose an opponent: #{COMPUTER_NAMES.join(', ')}"
      n = gets.chomp
      break if COMPUTER_NAMES.include?(n.downcase)
      prompt "Sorry, must enter a valid name from the options."
    end
    self.name = n
  end
end

# R2D2 always chooses lizard
class R2D2 < Computer
  def initialize
    super
    self.name = 'R2D2'
  end

  def choose
    self.move = Move.new('lizard')
  end
end

# C3PO chooses a random move from either rock, paper, or scissors
class C3PO < Computer
  def initialize
    super
    self.name = 'C3PO'
  end

  def choose
    self.move = Move.new(VALUES.values[0..2].sample)
  end
end

# Yoda chooses the values in order: rock, paper, scissors, lizard, spock
class Yoda < Computer
  def initialize
    super
    self.name = 'Yoda'
    @counter = 0
  end

  def choose
    self.move = Move.new(VALUES.values[@counter])
    @counter +=1
  end
end

# Darth_Vader is more likely to choose rock or scissors than anything else
class Darth_Vader < Computer
  def initialize
    super
    self.name = 'Darth Vader'
  end

  def choose
    vader_choices = VALUES.values
    vader_choices << 'rock' << 'scissors'
    self.move = Move.new(vader_choices.sample)
  end
end

# BB-8 chooses a random value from all 5 options
class BB_8 < Computer
  def initialize
    super
    self.name = 'BB-8'
  end

  def choose
    self.move = Move.new(VALUES.values.sample)
  end
end

class RPSGame
  include PROMPTING

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
    clear_screen
    puts "****************************************************************"
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock".center(65)
    puts "** The first player to #{WINNING_SCORE} points wins **".center(65)
    puts ""
  end

  def display_goodbye_message
    prompt "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    prompt "You chose #{human.move} and #{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      prompt "You won!"
    elsif human.move < computer.move
      prompt "#{computer.name} won!"
    else
      prompt "It's a tie!"
    end
    sleep(1)
    prompt "Score: #{human.name}:#{human.score}  #{computer.name}:#{computer.score}"
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
      prompt "#{winner.name} won by making it to #{WINNING_SCORE} first!"
      return false
    end

    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      prompt "Sorry, must be y or n."
    end

    clear_screen

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end
  
  def increment_score(player)
    player.score +=1 unless player.nil?
  end
  
  def update_history(player)
    player.move_history << player.move 
  end
  
  def print_history(player)
    player.move_history.each_with_index do |move, index|
      prompt "Round ##{index+1}: #{move}"
    end
  end
  
  def clear_screen
    system 'clear'
  end

  def play
    display_welcome_message
    human.set_name
    sleep(1)
    set_computer
    game_play
    prompt "Game summary:"
    puts "---------------------------"
    sleep(1)
    prompt "Your moves:"
    print_history(human)
    puts "---------------------------"
    sleep(1)
    prompt "#{computer.name}'s moves:"
    print_history(computer)
    puts "---------------------------"
    sleep(1)
    display_goodbye_message
  end

  private 
  
  def game_play
    loop do
      human.choose
      update_history(human)
      computer.choose
      update_history(computer)
      display_moves
      sleep(1)
      increment_score(winner)
      display_winner
      sleep(1)
      break unless play_again?
    end
  end
end

RPSGame.new.play