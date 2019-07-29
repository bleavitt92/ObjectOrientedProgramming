class MinilangError < StandardError; end 
class BadTokenError < MinilangError; end 
class EmptyStackError < MinilangError; end 

class Minilang
  ACTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(string)
    @string = string
  end

  def eval(mph: nil)
    @mph = mph
    @register = 0
    @stack = []
    @string.split.each do |command|
      eval_command(command) 
    end
  rescue MinilangError => error # keeps the program going if reach an error
    puts error.message
  end

  def eval_command(command)
    if ACTIONS.include?(command)
      send(command.downcase)
    elsif command =~ /\A[+-]?\d+\Z/ # is a digit
      @register = command.to_i
    elsif command =~ /mph/
      @register = @mph
    else
      raise BadTokenError, "Invalid token #{command}"
    end
  end

  def print
    puts @register
  end

  def pop 
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def push
    @stack.push(@register)
  end

  def add
    @register += pop
  end 

  def sub 
    @register -= pop
  end 

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end 

  def mod
    @register %= pop 
  end 
end

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'

# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # # 32
# minilang.eval(degrees_c: -40)
# # # -40

MILES_TO_KM = '3 PUSH %<mph>d PUSH 5 MULT DIV PRINT'
minilang = Minilang.new(MILES_TO_KM)
minilang.eval(mph: 100)