class Dog
  @@number_dogs = 0
  
  def initialize(name)
    @name = name
    @@number_dogs += 1
  end

  def name
    "The dogs name is #{@name}"
  end
  
  def self.how_many_dogs
    @@number_dogs
  end
end

peyton = Dog.new('Peyton')
riley = Dog.new('Riley')
puts Dog.how_many_dogs
puts peyton.name