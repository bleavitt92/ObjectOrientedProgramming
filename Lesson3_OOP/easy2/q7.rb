class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# The @@cats_count variable is a class variable. It is keeping track of how many Cat instances are created. Each time Cat.new is called, the initialize method is automatically called and @@cats_count += 1 adds 1 to the @@cats_count class variable. Call it by using Cat.cats_count

# test that logic

p Cat.cats_count # 0
Cat.new('blakc')
p Cat.cats_count # 1
Cat.new('orange')
Cat.new('red')
p Cat.cats_count # 3