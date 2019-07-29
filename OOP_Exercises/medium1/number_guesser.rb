# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:
require 'pry'

class GuessingGame
  attr_accessor :num_guesses, :guess
  attr_reader :number

  def initialize
    @num_guesses = 7
    @secret_number = (1..100).to_a.sample
    @guess = nil
  end

  def display_guesses_left
    puts "You have #{@num_guesses} guesses remaining."
  end

  def guess_number
    puts "Enter a number between 1 and 100: "
    loop do
      @guess = gets.chomp.to_i
      break if (1..100).to_a.include?(guess)
      puts "Invalid guess. Enter a number between 1 and 100: "
    end
  end

  def display_results
    if guess == secret_number
      puts "That's the number!"
    elsif guess < secret_number
      puts "Your guess is too low."
      update_guesses
    elsif guess > secret_number
      puts "Your guess is too high."
      update_guesses
    end
  end

  def update_guesses
    @num_guesses = @num_guesses-1
  end

  def won?
    guess == secret_number
  end

  def goodbye_message
    if won?
      puts "You won!"
    else
      puts "You're out of guesses. Game over."
    end
  end

  def play
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


game = GuessingGame.new
game.play

  # You have 7 guesses remaining.
  # Enter a number between 1 and 100: 104
  # Invalid guess. Enter a number between 1 and 100: 50
  # Your guess is too low.
  
  # You have 6 guesses remaining.
  # Enter a number between 1 and 100: 75
  # Your guess is too low.
  
  # You have 5 guesses remaining.
  # Enter a number between 1 and 100: 85
  # Your guess is too high.
  
  # You have 4 guesses remaining.
  # Enter a number between 1 and 100: 0
  # Invalid guess. Enter a number between 1 and 100: 80
  
  # You have 3 guesses remaining.
  # Enter a number between 1 and 100: 81
  # That's the number!
  
  # You won!
  
  # game.play
  
  # You have 7 guesses remaining.
  # Enter a number between 1 and 100: 50
  # Your guess is too high.
  
  # You have 6 guesses remaining.
  # Enter a number between 1 and 100: 25
  # Your guess is too low.
  
  # You have 5 guesses remaining.
  # Enter a number between 1 and 100: 37
  # Your guess is too high.
  
  # You have 4 guesses remaining.
  # Enter a number between 1 and 100: 31
  # Your guess is too low.
  
  # You have 3 guesses remaining.
  # Enter a number between 1 and 100: 34
  # Your guess is too high.
  
  # You have 2 guesses remaining.
  # Enter a number between 1 and 100: 32
  # Your guess is too low.
  
  # You have 1 guesses remaining.
  # Enter a number between 1 and 100: 32
  # Your guess is too low.
  
  # You have no more guesses. You lost!