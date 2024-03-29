module Movable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency
  attr_reader :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Movable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Seacraft
  include Movable
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
  
  def range
    super + 10
  end
end

class Catamaran < Seacraft
end

class Motorboat < Seacraft
  def initialize(fuel_efficiency, fuel_capacity)
    super(1, 1, fuel_efficiency, fuel_capacity)
  end
end

tacoma = WheeledVehicle.new([4], 10, 30)
p tacoma.range

dream = Catamaran.new(4, 3, 15, 10)
p dream
p dream.range

motor = Motorboat.new(10, 20)
p motor
p motor.range
