# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors? - call .ancestors on the object

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p Orange.ancestors

# What is the lookup chain for Orange and HotSauce? 
# # - Orange, Taste, Object, Kernel, BasicObject
# # - HotSauce, Taste, Object, Kernel, BasicObject