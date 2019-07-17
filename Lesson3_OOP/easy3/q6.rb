class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  # def make_one_year_older
  #   self.age += 1
  # end

  def make_one_year_older
    @age +=1
  end
end

callie = Cat.new('black')
p callie.make_one_year_older

# rewrite make_one_year_older method so don't have to use self
# self in this case is referencing the setter method provided by attr_accessor - this means that we could replace self with @

# If you want to set/update the value of an attribute, you can either use a setter or access the attribute directly ie with @. if you don't use a setter or you dropped the @, Ruby thinks you are trying to set a new local variable. In your case you are trying to increment a new local variable; age (so thinks Ruby) which you have not initialize(its value is therefore nil). Ruby then throws the NoMethodError.