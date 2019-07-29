require_relative '../lib/ufo.rb'

class Ufo_game 

    def initialize
        @guesses_remaining = 6
        @wrong_guesses = []
        @correct_guesses = []
        @secret_word = "testword"
    end

    def welcome
        puts "UFO: The Game"
        puts "instructions: save us from alien abduction by guessing        letters in the codeword."
    end

    def print_pic 
        puts $x[6 - @guesses_remaining]
    end

    def print_status
        puts "Incorrect Guesses:"
        puts "NONE"
        puts "Codeword:"
        puts   "_ _ _ _ _ _ _ _ _ _"
    end

    def play
        welcome 
        print_pic
        print_status
    end

end