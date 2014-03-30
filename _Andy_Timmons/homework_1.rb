puts "Welcome to the game, this was created by Andy Timmons"
puts "What is your name? "
name = gets

puts "Hi " + name

puts "I am going to think of a secret integer between 1 and 10. I am going to give you 3 guesses to get it right."

def has_chance(answer, chances)
	#method makes sure user has more than 0 chances and then will accept a guess if has them
	if chances == 0
		puts "You are out of chances and you lost.  Thank you for playing!"
		return
	else
		puts "You have " + chances.to_s + " chances to get it right."
  	sanitize_guess(answer, chances)	
  end
end

def sanitize_guess(answer, chances)
	#method makes sure guess is a proper input and then will check it
	puts "What is your guess?"
	guess = gets.to_i #rounding down integers because could not figure out is not integer statement
	if guess < 1 || guess > 10 
		puts "You guess has to be greater than or equal to one, less than or equal than ten, and an Integer"
		sanitize_guess(answer, chances)
	else 
		check_guess(guess, answer, chances)
	end
end

def check_guess(guess, answer, chances)
	#checks the answer of the user and will
	if guess == answer
		puts "You are correct!  Great job!"
	elsif guess < answer
		puts "You guessed too low!"
		take_guess(answer, chances-1)
	elsif guess > answer
		puts "You guessed too high!"
		take_guess(answer, chances-1)
	end		
end


has_chance((1..10).to_a.sample, 3)	


