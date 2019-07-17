class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# What is used in this class but doesn't add any value?
# return on line 10
# did not use attr_accessor on line 2 either, but we have the option to adjust brightness and color outside the Light class now
