class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
  
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
  
  # don't need these lines b/c of line 2
  # def name # getter method
  #   @name
  # end
  
  # def name=(name) # setter method
  #   @name = name
  # end

  def speak
    "#{name} says 'Arf'"
  end
  
  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end 
end 

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
fido = GoodDog.new('Fido', '24 inches', '45 lbs')

puts sparky.speak
puts fido.speak
puts sparky.name
puts sparky.info
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info