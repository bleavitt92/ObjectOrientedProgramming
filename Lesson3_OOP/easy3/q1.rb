class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi # 'Hello', returns nil from puts

hello = Hello.new
hello.bye # undefined method error

hello = Hello.new
hello.greet # wrong number of arguments

hello = Hello.new
hello.greet("Goodbye") # 'Goodbye'

Hello.hi # a new instance of the class Hello is not created for hi to be called upon. It is an instance method (not a class method) so it needs this
