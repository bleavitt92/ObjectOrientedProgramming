class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
# You can see in the make_one_year_older method we have used self. What does self refer to here?

# self refers to the object created within the class Cat
# it references the instance (object) that called the method - the calling object

callie = Cat.new('tiny')
gracie = Cat.new('teeny')
callie.make_one_year_older
p callie
callie.make_one_year_older
p callie
p gracie