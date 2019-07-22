# class Computer
#   attr_accessor :template # this line only needs to be writer b/c in line 5, we are directly accessing the @template instance variable

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template
#   end
# end

class Computer
  attr_accessor :template # cannot change this line to reader because line 17 uses the writer/setter method to set template to 'template14231'

  def create_template
    self.template = "template 14231" # need self here b/c if don't have it, ruby will set a local variable template to 'template 14231' instad of setting the instance variable using the setter method
  end

  def show_template
    template # don't need self here for the getter method template
  end
end

dell = Computer.new
dell.create_template
p dell.show_template