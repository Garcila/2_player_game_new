require 'pry'
require './player'

class Game

	attr_accessor :player1, :player2, :current_player
	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		@current_player = player1
	end

	def random_number
		@number = rand(1..20)
	end

	def question
		number1 = random_number
		number2 = random_number
		answer = number1 + number2
		puts "#{@current_player.name}, tell me what is  #{number1} + #{number2}?"
		check_answer(answer, gets.chomp.to_i)
	end

	def check_answer(correct_answer, user_answer)
		if correct_answer == user_answer
			current_player.increase_score
			puts "That is correct, you gain a point.  Now you have #{current_player.score} points and #{current_player.lives} lives"
		else
			current_player.lose_lives
			puts "Sorry, that is wrong, you loose one life. Now you have #{current_player.score} points and #{current_player.lives} lives"	
		end
	end

	def start_game
		# Player.get_names
		while !@player1.is_dead? && !@player2.is_dead?
			question
			change_player
		end
		puts "The final score is #{@player1.name} ----------------- #{player1.score}"
		puts "                   #{@player2.name} ----------------- #{player2.score}"
	end

	def change_player
		if @current_player == @player1
			@current_player =  @player2
		else
			@current_player =  @player1
		end
	end

end

# @player1 = Player.new('German')
# @player2 = Player.new('Laith')
@game = Game.new(Player.new, Player.new)

@game.start_game