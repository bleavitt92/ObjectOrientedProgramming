class GoodDog
  @@number_of_dogs = 0
  
  def initialize # initialize gets called everytime we instantiate a new object via the new method
    @@number_of_dogs += 1
  end
  
  def self.total_number_of_dogs # doesn't pertain to individual objects so class method
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs