class Pet
  attr_reader :animal, :pet_name

  def initialize(animal, pet_name)
    @animal = animal
    @pet_name = pet_name
  end
  
  def print_pet
    puts "a #{animal} named #{pet_name}."
  end
end

class Owner
  attr_reader :pet, :pets, :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def adopt_pet(pet)
    pets << pet
  end
  
  def show_adopted_pets
    p pets
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  attr_reader :owner, :pet, :adoptions

  def initialize
    @adoptions = Hash.new
  end

  def adopt(owner, pet)
    @adoptions[owner] = owner.adopt_pet(pet)
  end

  def print_adoptions
    @adoptions.each_pair do |owner, pets|
      puts "#{owner.name} has adopted the following pets"
      pets.each do |pet|
        pet.print_pet
      end
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
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
