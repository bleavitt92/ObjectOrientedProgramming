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

class Parent
  def say
    p "I'm the parent"
  end
end

class Child < Parent
  def say(message)
    super()
  end
end

Child.new.say('Hi!')