class Cat
  attr_reader :type # need this or can't reference type in line 9

  def initialize(type)
    @type = type
  end

  def to_s
    "I'm a #{type} cat!"
  end
end

callie = Cat.new('black')
p callie.to_s
