require_relative './ufo.rb'
require_relative './cli_variables'

def welcome 
   puts "UFO: The Game"
   puts "Instructions: save us from alien abduction by guessing letters in the codeword."
   puts $x[0]
end

def guess_status 
    puts "Incorrect Guesses:" 
    puts $incorrect_guesses

    puts "Codeword:"
    puts $guess
end 