# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Pizza. @name is an instance variable because the @ 
# can double check by: 
hot_pizza = Pizza.new('cheese')
orange = Fruit.new('apple')

p hot_pizza.instance_variables
p orange.instance_variables