class Test
  @@count = []
  def initialize(num)
    @@count << num
  end
  def self.printcount
    p @@count
  end
end

test1 = Test.new(4)
test2 = Test.new(5)
p Test.printcount
