#welcoming player
puts "Welcome to the Secret Game!"
puts "Please tell me your name"

#getting their name
name = gets.chomp

puts "Hi #{name}! You will be guessing a number between 1 and 10, and have three tries to get it right."

#setting the number
game_num = 8

puts "What is your guess?"

player_num = gets.chomp.to_i

counter = 1

#loop for determining number of guesses and conditional for what to do next

while counter < 4

	if player_num == game_num

		puts "Congratulations, you guessed it correctly!"
		break

	elsif player_num > game_num

		puts "Your number was a bit too high, try again"
		counter = counter + 1

		if counter == 4
			puts "Sorry you have lost the game. The number was #{game_num}."
		else
			puts "Number of guesses left: #{4 - counter}"
			player_num = gets.chomp.to_i
		end

	elsif player_num < game_num

		puts "Your number was a bit too low, try again"
		counter = counter + 1
		
		if counter == 4
			puts "Sorry you have lost the game. The number was #{game_num}."
		else
			puts "Number of guesses left: #{4 - counter}"
			player_num = gets.chomp.to_i
		end

	end
end







