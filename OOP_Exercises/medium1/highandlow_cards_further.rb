# Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects:

class Card
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUITS = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "The #{@rank} of #{@suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

   def suitval
    SUITS.fetch(suit)
  end

  def ==(other)
    value == other.value
  end

  def <=>(other)
    if (value <=> other.value) == 0
      suitval <=> other.suitval
    else
      value <=> other.value
    end
  end
end


cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new('Ace', 'Clubs'),
         Card.new(10, 'Spades'),
         Card.new(2, 'Diamonds'), 
         Card.new(4, 'Spades')]

puts cards.sort 
