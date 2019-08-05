class Cat
# omitted code
  def self.speak
    puts "Meow"
  end
end

Cat.speak

class Person
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def update_info(n, a)
    self.name = n    # must have self here to access setter method name=() instead of assigning a local variable name to n
    self.age = a
  end
  
  def to_s
    "Name: #{name}, Age: #{age}"
  end
end

david = Person.new("David", 27)
puts david
david.update_info('Betsy', 27)
puts david