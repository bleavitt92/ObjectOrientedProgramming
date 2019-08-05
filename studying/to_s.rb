class Person
  def initialize(age, height)
    @age = age
    @height = height
  end
  
  def to_s
    "Age: #{@age}
    Height: #{@height}"
  end
end

david = Person.new(27, 71)
puts david
