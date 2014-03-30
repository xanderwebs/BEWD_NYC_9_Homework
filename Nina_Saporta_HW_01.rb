
def welcome_message
  puts "Welcome to the secret number guessing game!!  This game was created by aspiring developer Nina Saporta!"
end

def player_name (playername)
  puts "Hi #{playername}!"
end

def game_rules
  puts "This game gives you a chance to test your guessing skills.  Simply pick a number between 1 and 10, and the game will let you know if you've selected the right number.  You have 3 chances, so guess wisely!"
end

def secret_number
  3
end

#This method asks the user to enter a number then uses conditionals to determine if it's the correct number or not.  It then determines if the player can continue playing or if "game over" based on how many total_games they have left.
def ask_user_guess (total_games = 3)
  puts "Please guess a nunmber between 1 and 10!"
  user_guess = gets
  user_guess = user_guess.chomp.to_i
  if user_guess == secret_number
    puts "That's correct! Congratulations!!! Game over!"
  elsif
  user_guess > secret_number
  total_games = total_games -1
   	if total_games  > 0
  	  puts "Too high! Guess again! You have #{total_games} games left"
  	  ask_user_guess(total_games)
  	else
  	  puts "Sorry, no more guesses.  The correct answer was 3. Game over!"
  	end
  else
  total_games = total_games -1
  	if total_games > 0
      puts "Too low! Guess again You have #{total_games} games left"
  	  ask_user_guess(total_games)
  	else
  	  puts "Sorry, no more guesses.  The correct answer was 3.  Game over!"
  	end
  end
end


puts welcome_message

puts "What is your name?"
playername = gets
puts "Hello " + playername + "get ready to play!"

puts game_rules

ask_user_guess
 

