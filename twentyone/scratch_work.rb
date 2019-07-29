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
    when 'A' 
      'Ace'
    when 'K'
      'King'
    when 'Q'
      'Queen'
    when 'J'
      'Jack'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H'
      'Hearts'
    when 'D'
      'Diamonds'
    when 'S'
      'Spades'
    when 'C'
      'Clubs'
    end
  end
end

class Deck
  attr_accessor :card_deck, :suit, :face

  def initialize
    @card_deck = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        card_deck << Card.new(suit, face)
      end
    end

    @card_deck.shuffle!
  end

  def deal_a_card
    card_deck.pop
    puts "You delt a #{face} of #{suit}"
  end
end

class Hand
  def initialize
    @players_hand = []
  end
end

my_card = Card.new('D', 'K')
p my_card.to_s

my_deck = Deck.new
p my_deck.deal_a_card