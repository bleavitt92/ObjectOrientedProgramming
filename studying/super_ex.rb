class Animal
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Dog < Animal
  def initialize(name, age)
    super(name, age)
    @age = age*7 # for 'dog years'
  end
end

class Cat < Animal
  def initialize(name, age)
    super()
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