require_relative '../lib/ufo.rb'

class Ufo_game 

    def initialize
        @guesses_remaining = 6
        @incorrect_guesses = []
        @correct_guesses = []
        @secret_word_display= []
        @secret_word = "TESTWORD"
    end

    def welcome
        puts "UFO: The Game"
        puts "instructions: save us from alien abduction by guessing letters in the codeword."
    end

    def initialize_secret_word_display
        @secret_word.length.times do |i|
            @secret_word_display.push("_")
        end
    end

    def print_pic 
        puts $x[6 - @guesses_remaining]
    end

    def print_incorrect_guesses
        if @incorrect_guesses != [] 
            @incorrect_guesses.each do |letter|
                puts letter + " "
            end
        else  
            puts "NONE"
        end
    end

    def print_status
        puts "Incorrect Guesses:"
        print_incorrect_guesses
        puts "Codeword:"
        print_secret_word_display
    end

    def print_secret_word_display
        @secret_word_display.each do |letter|
            print letter + " "
        end 
    end

    def check_guess_valid?(input)
        if input =~ /[[:alpha:]]/ && input.length == 1
            return true 
        else  
            return false
        end
    end

    def check_guess(input)
        bool = false
        @secret_word.length.times do |i|
            if @secret_word[i].upcase == input.upcase 
                @secret_word_display[i] = input.upcase
                bool = true 
            end 
        end

        if bool == false 
            @incorrect_guesses.push(input)
            
        end
    end

    def turn 
            puts "please enter your guess:"
            current_guess = gets.chomp
            if !check_guess_valid?(current_guess)
                puts "I cannot understand your input. Please guess a single letter."
            else  
                check_guess(current_guess)
                @guesses_remaining -= 1
            end
            print_pic
            print_status
    end

    def play
        initialize_secret_word_display
        welcome 
        print_pic
        print_status
        while @guesses_remaining != 0 
            turn
        end
    end

end