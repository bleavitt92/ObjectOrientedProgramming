# If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  #include module here
  include Speed
  
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  #include module here
  include Speed
  
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# to check call go_fast on a truck and car object
Truck.new.go_fast
Car.new.go_fast

# it is printing the name of the type of vehicle buy calling self.class within the go_fast method. self.class is going to refer to the type of class go_fast is called upon and that the object itself is within. Don't need to_s bc inside of a string and it is interpolated so to_s taken care of. 