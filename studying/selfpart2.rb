class Yourself
  def see_yourself
    self
  end
end

me = Yourself.new
puts me.see_yourself == me