class Dog
  def initialize(age)
    @age = age
  end
  
  def make_noise
    speak
  end

  def older?(other)
    age > other.age
  end
  
  protected
  attr_reader :age # can call getter method as long as by an object that belongs to the dog class. Would do this if don't want to be able to see the dogs age but still want to compare who is older. 

  private # can call these methods from within the class definition like on line 7
  def speak
    puts 'bark bark bark'
  end

  def to_s
    "This pup is #{age} years old!"
  end
end

peyton = Dog.new(3)
riley = Dog.new(2)
puts peyton
peyton.make_noise
puts peyton.older?(riley)
