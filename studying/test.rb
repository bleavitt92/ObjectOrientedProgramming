module Magic
  def cast_spell
  end
end

module Armor
  def attach_armor
  end

  def remove_armor
  end
end

class Player
  attr_reader :name, :strength, :intelligence, :health

  def initialize(name, health=100)
    @name = name
    @health = health
    @strength = roll_dice
    @intelligence = roll_dice
  end
  
  def heal(amount)
    @health += amount
  end
  
  def hurt(amount)
    @health -= amount
  end

  def to_s
    "Name: #{name}
Class: #{self.class}
Health: #{health}
Strength: #{strength}
Inteligence: #{intelligence}"
  end

  private
  def roll_dice
    (2..12).to_a.sample
  end
end

class Warrior < Player
  include Armor

  def initialize(name)
    super
    @strength = roll_dice + 2
  end
end

class Paladin < Player
  include Magic
  include Armor
end

class Magician < Player
  include Magic

  def initialize(name)
    super
    @intelligence = roll_dice + 2
  end
end

class Bard < Magician
  def create_potion
  end
end

me = Player.new('John')
puts me
puts ''
warrior = Warrior.new('Jimmy')
puts warrior

bard = Bard.new('Joseph')
puts bard

magician = Magician.new('Jeremy')
puts magician

palidin = Paladin.new('Joe')
puts palidin