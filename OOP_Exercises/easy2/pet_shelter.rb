# Write the classes and methods that will be necessary to make this code run, and print the following output:

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
  
  def to_s
    "a #{type} named #{name}" # if return object says this
  end
end

class Owner
  @@owners_arr = []
  attr_reader :last_name

  def initialize(last_name)
    @last_name = last_name
    @@owners_arr << last_name
    @pets = []
  end
  
  def self.return_owner_arr
    @@owners_arr
  end
  
  def get_pet(pet)
    @pets << pet
  end
end

class Shelter
  def adopt(owner, pet)
    owner.get_pet(pet)
  end

  def print_adoptions
    Owner.return_owner_arr.each do |person|
      puts "#{person} has adopted the following pets:"
      puts "#{Pet.name}"
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."