require 'pry'

class GuessingGame
  attr_accessor :num_guesses, :guess
  attr_reader :number, :lower_bound, :upper_bound

  def initialize(lower_bound, upper_bound)
    @guess = nil
    @lower_bound = lower_bound
    @upper_bound = upper_bound
  end

  def reset
    @secret_number = (@lower_bound..@upper_bound).to_a.sample
    puts "secret num is #{@secret_number}"
    @num_guesses = Math.log2(upper_bound - lower_bound+1).to_i + 1
  end

  def display_guesses_left
    puts "You have #{@num_guesses} guesses remaining."
  end

  def guess_number
    puts "Enter a number between #{@lower_bound} and #{@upper_bound}: "
    loop do
      @guess = gets.chomp.to_i
      break if (@lower_bound..@upper_bound).cover?(guess)
      puts "Invalid guess. Enter a number between #{@lower_bound} and #{@upper_bound}: "
    end
  end

  def display_results
    if guess == @secret_number
      puts "That's the number!"
    elsif guess < @secret_number
      puts "Your guess is too low."
      update_guesses
    elsif guess > @secret_number
      puts "Your guess is too high."
      update_guesses
    end
  end

  def update_guesses
    @num_guesses = @num_guesses-1
  end

  def won?
    guess == @secret_number
  end

  def goodbye_message
    if won?
      puts "You won!"
    else
      puts "You're out of guesses. Game over."
    end
  end

  def play
    reset
    loop do 
      display_guesses_left
      guess_number
      display_results
      puts ''
      break if won? || @num_guesses == 0
    end
    goodbye_message
  end
end


game = GuessingGame.new(501, 1500)
game.play
