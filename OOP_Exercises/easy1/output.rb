# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# initial output: Fluffy, My name is FLUFFY, FLUFFY, FLUFFY

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name # 42
puts fluffy # My name is 42
puts fluffy.name # 42
puts name # 43