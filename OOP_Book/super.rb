class Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color) # if used (color, name) could control name below on line 16
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno