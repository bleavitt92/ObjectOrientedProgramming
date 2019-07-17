# When objects are created they are a separate realization of a particular class

# Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

callie = AngryCat.new(8, 'Callie')
gracie = AngryCat.new(2, 'Gracie')
