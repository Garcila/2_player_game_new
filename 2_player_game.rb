require 'pry'
#  DONE  get player's names.
#  DONE addition questions
#  DONE questions automatically generated
#  DONE the game selects question by picking number between 1 and 20
#  DONE evaluate answer
#  Each player has 3 lives
#  Lose a life evey wrong answer
#  keep score
#  every wrong answer display score for the two players
#  game ends when one player looses all lives
#  State who won and looser's score

# get player's names

def get_names
	player_number = 1
	puts "Please type your name, player#{player_number}"
	@player_1 = gets.chomp
	player_number += 1
	puts "Please type your name, player#{player_number}"
	@player_2 = gets.chomp
	puts "------------------------------------------"
	puts "Ok #{@player_1} and #{@player_2}, let's play our math game"
	puts "------------------------------------------"
end

get_names

@current_player = @player_1
@player_1_score = 0
@player_2_score = 0
@player_1_lives = 3
@player_2_lives = 3

while (@player_1_lives > 0) || (@player_2_lives > 0)
	def generate_numbers
		@first_number = rand(1..20)
		@second_number = rand(1..20)
	end

	def addition_problem
		generate_numbers
		puts "#{@current_player}, tell me how much is #{@first_number} plus #{@second_number}?"
		@answer = gets.chomp.to_i
	end

	addition_problem

	def evaluate_answer
		@answer == @first_number  + @second_number
	end

	evaluate_answer

	def score 
			if evaluate_answer
				if @current_player == @player_1
					@player_1_score += 1
					puts "#{@current_player}, that is correct. Your current score is: #{@player_1_score} and you have #{@player_1_lives} lives left"
				else
					@player_2_score += 1
					puts "#{@current_player}, that is correct. Your current score is: #{@player_2_score} and you have #{@player_2_lives} lives left"
				end
			else
				if @current_player == @player_1
					@player_1_lives -= 1
					puts "#{@current_player}, that is correct. Your current score is: #{@player_1_score} and you have #{@player_1_lives} lives left"
				else
					@player_2_lives -= 1
					puts "#{@current_player}, that is correct. Your current score is: #{@player_2_score} and you have #{@player_2_lives} lives left"
				end
			end
	end

	score

	def current_player
		if @current_player == @player_1
			@current_player = @player_2
		else
			@current_player = @player_1
		end
	end

	current_player
	p @current_player
end
