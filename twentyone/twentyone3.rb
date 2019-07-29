require 'pry'

class Card
  VALUES = { 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11 }

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "The #{@value} of #{@suit}"
  end

  def ace?
    value == 'Ace'
  end

  def king?
    value == 'King'
  end
  
  def queen?
    value == 'Queen'
  end
  
  def jack?
    value == 'Jack'
  end

end

class Deck
  attr_accessor :cards

  VALUES = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  attr_accessor :cards
  
  def initialize
    @cards = []
    VALUES.each do |value|
      SUITS.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

class Participant
  # have behaviors that are part of both player and computer
  # initiate a hand
  # deal cards at beginning
  
  attr_accessor :hand, :name
  
  def initialize
    @hand = []
    set_name
  end

  def add_card(new_card)
    @hand << new_card
  end

  def show_hand
    puts "-----#{name}'s Hand----- "
    hand.each do |card|
      puts "=> #{card}"
    end
    puts "=> For a total of #{total}."
    puts ''
  end

  def total
    total = 0
    hand.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.value.to_i
      end
    end
    hand.count { |card| card.ace? }.times do 
      total -=10 if total > 21
    end
    total
  end

  def hit(new_card)
    puts "#{name} hits!"
    add_card(new_card)
  end

  def stay
    puts "#{name}'s decided to stay!"
  end

  def turn_over?
    twenty_one? || busted?
  end

  def twenty_one?
    total == 21
  end

  def busted?
    total > 21
  end

  def show_hand_results
    if busted?
      puts "#{name} busted!"
    elsif twenty_one?
      puts "#{name} got 21!"
    end
  end

  def >(other)
    total > other.total
  end

  def ==(other)
    total == other.total
  end
end

class Player < Participant
  def set_name
    # loop do
    #   puts "What is your name?"
    #   name = gets.chomp
    #   break unless name.length == 0
    # end
    self.name = 'Betsy'
  end
end

class Computer < Participant
  def set_name
    self.name = "Computer"
  end

  def turn(new_card)
   
  end

  def show_one_card
    puts "----The computer's hand----"
    puts "=> #{self.hand[0]}"
    puts "=> ????"
  end
end

class TwentyOne
  attr_reader :deck, :player, :computer

  def initialize
    @deck = Deck.new 
    @player = Player.new
    @computer = Computer.new
  end

  def reset
    system 'clear'
    player.hand = []
    computer.hand = []
    @deck = Deck.new
  end

  def display_welcome_message
    puts "Welcome to TwentyOne!"
    puts "Get as close to 21 as possible without going over"
    puts ''
  end

  def initial_deal_cards
    2.times do 
      player.add_card(deck.deal_one)
      computer.add_card(deck.deal_one)
    end
  end

  def show_cards
    player.show_hand
    puts ''
    computer.show_one_card
    puts ''
  end

  def player_turn
    loop do
      puts "Hit or Stay? (H or S)"
      answer = ''
      loop do
        answer = gets.chomp.downcase
        break if %w(h s).include?(answer)
        puts "Invalid input. Must be 'H' or 'S'!"
      end

      answer == 'h' ? player.hit(deck.deal_one) : player.stay

      player.show_hand
      break if player.turn_over? || answer == 's'
    end
    player.show_hand_results
  end

  def computer_turn
    loop do 
      if computer.total < 17
        computer.hit(deck.deal_one)
      elsif computer.busted?
        break
      else
        computer.stay
        break
      end
    end
    computer.show_hand
    computer.show_hand_results
  end

  def display_winner
    if who_won?.nil?
      puts "It's a tie!"
    else
      puts "The winner is: #{who_won?.name}"
    end
  end

  def who_won?
    if player.busted? || computer > player
      computer
    elsif computer.busted? || player > computer
      player
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y or n)"
      answer = gets.chomp
      break if %w(y n).include?(answer.downcase)
      puts "Sorry must be a y or n"
    end
    answer.downcase == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty-One! Goodbye!"
  end

  def play
    display_welcome_message
    loop do 
      initial_deal_cards
      show_cards
      player_turn
      computer_turn
      display_winner
      break unless play_again?
      reset
    end
    display_goodbye_message
  end
end

TwentyOne.new.play
