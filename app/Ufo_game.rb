require_relative '../lib/ufo.rb'

class Ufo_game 

    def initialize
        @guesses_remaining = 6
        @incorrect_guesses = []
        @correct_guesses = []
        @secret_word_display= []
        @secret_word = ""
    end

    def welcome
        puts "UFO: The Game"
        puts "instructions: save us from alien abduction by guessing letters in the codeword."
    end

    def initialize_secret_word 
        # https://stackoverflow.com/questions/11007111/ruby-whats-an-elegant-way-to-pick-a-random-line-from-a-text-file
        chosen_word = nil
        File.foreach('./lib/nouns.txt').each_with_index do |word, number|
        chosen_word = word if rand < 1.0/(number+1)
        end
        @secret_word = chosen_word
    end

    def initialize_secret_word_display
        @secret_word_display = []
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
                print letter + " "
            end
        else  
            puts "NONE"
        end
    end

    def print_status
        puts "Incorrect Guesses:"
        print_incorrect_guesses
        puts ""
        puts "Codeword:"
        puts ""
        print_secret_word_display
        puts ""
    end

    def print_secret_word_display
        @secret_word_display.each do |letter|
            print letter + " "
        end 
    end

    def check_guess_valid?(input)
        if input =~ /[[:alpha:]]/ && input.length == 1 && !@incorrect_guesses.include?(input.upcase)
            return true 
        else  
            return false
        end
    end

    def check_guess(input)
        bool = false
        letter = input.upcase
        @secret_word.length.times do |i|
            if @secret_word[i].upcase == letter 
                @secret_word_display[i] = letter
                if !@correct_guesses.include?(letter)
                    @correct_guesses.push(letter)
                end 
                bool = true 
            end 
        end

        if bool == false 
            @incorrect_guesses.push(letter)
            @guesses_remaining -= 1
            system 'clear'
            puts "Incorrect! The tractor beam pulls the person in further."
        else  
            system 'clear'
            puts "Correct! You're closer to cracking the codeword."
        end
    end

    def reveal_word 
        puts "By the by, the secret word was " + @secret_word
    end


    def turn 
            puts "please enter your guess:"
            current_guess = gets.chomp
            if !check_guess_valid?(current_guess)
                puts "I cannot understand your input. Or maybe you have used that letter before. Please guess a single letter."
            else  
                check_guess(current_guess)
            end
            print_pic
            print_status
    end

    def play
        continue = "Y"

        while continue == "Y"
            @guesses_remaining = 6
            @incorrect_guesses = []
            initialize_secret_word
            initialize_secret_word_display
            welcome 
            print_pic
            print_status
            while @guesses_remaining != 0 && @secret_word != @secret_word_display.join("")
                turn
            end

            if @secret_word == @secret_word_display.join("")
                print "Correct! You saved the person and earned a medal of honor!
                The codeword is:" + @secret_word
                puts ""
            else  
                print "No! They got yoouuu!!!"
                puts ""
                reveal_word
            end

            print "Would you like to play again (Y/N)?"
            continue = gets.chomp.upcase 
        end

    end

end