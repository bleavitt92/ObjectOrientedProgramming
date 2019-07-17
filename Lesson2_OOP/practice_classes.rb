class Person
  def initialize(name)
    @name = name
  end
  
  def to_s
    @name
  end
  
  def greet(other_name)
    puts "Hey #{other_name}, how are you? I'm #{@name}."
  end
end

class Child < Person
  def initialize(age, name)
    @age = age
    @name = name
  end
  
  def how_old?
    puts "I'm #{@name} and I'm #{@age} years old."
  end
end

david = Person.new("David")
david.greet("Betsy")
miles = Child.new(1, 'Miles')
p miles
miles.how_old?
miles.greet(david)