require_relative '../lib/ufo.rb'
require_relative '../lib/cli_functions.rb'

class Ufo_game 

    def initialize
        @guesses_remaining = 6
        @wrong_guesses = []
        @correct_guesses = []
        @secret_word = "whatever"
    end

    def play
        puts "does this work?"
    end

end