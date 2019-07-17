# Using the following code, add a method named #identify that returns its calling object.
# Using the following code, add two methods: ::generic_greeting and #personal_greeting. The first method should be a class method and print a greeting that's generic to the class. The second method should be an instance method and print a greeting that's custom to the object.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def identify
    self
  end
  
  def self.generic_greeting
    puts "Hello, I'm a cat!"
  end
  
  def personal_greeting
    puts "Hello, my name is #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.identify

Cat.generic_greeting
kitty.personal_greeting