class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  # def hi
  #   greet("Hello")
  # end
  # or
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Hello.hi gives an error. fix by first creating a new instance of the class Hello

Hello.hi

# or change hi to self.hi on line 8 making it a class method. 
# also need to create a new instance of Greeting within hi b/c it is an instance method