module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(amount)
    @speed += amount
    puts "You pushed the gas and are now going #{amount} mph faster"
  end
  
  def brake(amount)
     @speed -= amount
    puts "You pushed the brake and are now going #{amount} mph slower"
  end
  
  def turn_off
    @speed = 0
    puts "Turned off!"
  end
  
  def current_speed
    puts "You are now going #{@speed} mph"
  end
  
  def spray_paint(color)
    self.color = color
  end
  
  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_milage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def age
    "Your #{self.model} is #{years_old} years old."
  end
  
  private

  def years_old
    Time.now.year - self.year)
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Towable

   def to_s
    "My truck is a #{self.color}, #{self.year}, #{self.model}"
  end
end

my_car = MyCar.new('2008', 'Rogue', 'white') 

# my_car.speed_up(20)
# my_car.current_speed
# my_car.speed_up(20)
# my_car.current_speed
# my_car.brake(30)
# my_car.current_speed
# my_car.brake(10)
# my_car.current_speed
# my_car.turn_off
# my_car.current_speed

# my_car.color = 'black'
# puts my_car.color
# puts my_car.year
# my_car.spray_paint('red')
# puts my_car.color

MyCar.gas_milage(13, 351)

# puts Vehicle.ancestors
# puts MyCar.ancestors
# puts MyTruck.ancestors

puts my_car.age