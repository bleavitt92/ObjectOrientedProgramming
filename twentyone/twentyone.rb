require 'pry'

class Card
  SUITS = ['H', 'D', 'C', 'S']
  FACES = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "A #{face} of #{suit}"
  end

  def face
    case @face
    when 'A' then 'Ace'
    when 'K' then 'King'
    when 'Q' then 'Queen'
    when 'J' then 'Jack'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end
end

class Deck
  attr_accessor :cards, :suit, :face

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        cards << Card.new(suit, face)
      end
    end

    cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def to_s
    "The deck includes"
  end
end

module Hand
  def add_card(new_card)
    cards << new_card
  end

  def show_cards
    puts "Cards are"
    puts "#{cards}"
  end
end

class Participant
 include Hand

  attr_accessor :cards

  def initalize
    @cards = []
    set_name
  end

  def busted?
  end
  
  def total
  end
end

class Player < Participant
  def set_name
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.length == 0
    end
  end
end

class Dealer < Participant

end

class TwentyOne
  attr_accessor :deck, :player, :dealer, :cards
  # have access to deck object, player object, and dealter object

  def initalize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_cards
    player.add_card(deck.deal_one)
  end

  def show_initial_cards
    player.show_cards
  end

  def start
    deal_cards
    show_initial_cards
    # player_turn
    # dealer_turn
    #show_result
  end
end

game = TwentyOne.new
game.start

# notes
# Deck.new returns a deck object made up of an array of cards. Each card has a suit and a face
# Deck.new.cards returns an array of card object - call .suit or .face for type of card
