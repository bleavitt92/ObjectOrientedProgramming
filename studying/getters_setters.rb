class Dog
  attr_accessor :age, :weight, :color
end

peyton = Dog.new
peyton.age = 3
puts peyton.age
puts peyton.weight
peyton.weight = 49
peyton.weight = 50
puts peyton.weight

