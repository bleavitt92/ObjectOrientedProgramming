class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

# manufacturer is a class method so line 15 is using it appropriately (as opposed to line 12). model is an instance method so like 13 is correct and line 16 is not. 
