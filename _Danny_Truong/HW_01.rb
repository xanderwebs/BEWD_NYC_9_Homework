###############################################################################
#
# Back-End Web Development - Homework #1
#
# Secret Number is a game you will build in two parts.
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Read the instructions below.
# This exercise will test your knowledge of Variables and Conditionals.
#
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret number game. 
# In this game players have three tries to guess a secret number between 1 and 10. 
#
# Here are some guidelines to building your game:
#
#	Intros
# 	-	Welcome the player to your game. Let them know who created the game. 
#	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.
#
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.
#	 - 	Ask the user for their guess.
#	 -	Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#	 -	If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#	 - 	Don't forget to let your players know how many guesses they have left. Your game should say something like
#		  "You have X many guesses before the game is over enter a another number"
#	 -	If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
# 
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################

#hard coded secret number.  TO DO: set to random
secret_number = 3
#Welcome and ask for player name, capitalizes name
puts "\nWelcome to SECRET NUMBER!\nDan Truong's first RUBY game.\n\nLet's get started shall we?\nWhat should I call you?"
player_name = gets.chomp.capitalize
#greetings
puts "\nHi #{player_name}! Nice to meet you.\n\nSo here's how this game works.\nI'm thinking of a number between 1 and 10.\nI'm going to give you 3 chances to guess the SECRET NUMBER.\nEasy peasy. Let's begin!"

def guessing (answer)
#Initial number of guesses set at 3
	guesses_left = 3
	
	while (guesses_left > 0) do
#as long as guesses_left not 0, prompt for input. Convert input to number.
		puts "Guess!"

		guess = gets.chomp.to_i

#if the guess is not a number, converts to 0 and returns 'not a number error'
			if (0 < guess and guess < answer)
					guesses_left -= 1
					puts "That's a little low."
				elsif (guess > answer)
					guesses_left -= 1
					puts "That's a little high."
				elsif (guess == answer)
					guesses_left = 0
					puts "You got it!  Great job!"
				else 
					guesses_left -= 1
					puts "Come on, man.  The game is called secret NUMBER."
			end

			puts "You have #{guesses_left} guesses left."
	end

	puts "Game over!  The secret number was #{answer}\n"	
	
end


guessing (secret_number)
