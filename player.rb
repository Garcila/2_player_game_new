class Player

	attr_accessor :lives, :score, :name
	def initialize
		@name = get_names
		@lives = 3
		@score = 0
	end

	def lose_lives
		@lives -= 1
	end

	def increase_score
		@score += 1
	end

	def is_dead?
		@lives <= 0
	end

	def get_names
		puts "Hi,what is your name?"
		@name = gets.chomp
	end
end