# add line 4 to be able to access @volume instance variable

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

big_cube = Cube.new(5000)
p big_cube.volume
