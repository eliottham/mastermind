class HumanCodeBreaker
require_relative 'display'
	def initialize
		puts "Break the computer's secret code: ? ? ? ?"
		@secret_code = ['B', 'G', 'R', 'P', 'O', 'W'].sample(4)
		@turn = 0
		@game_board = Display.new
		@choices = Array.new(4)
		game
	end

	def make_guess
		puts "Color options: 'B' - blue, 'G' - green, 'R' - red, 'P' - purple, 'O' - orange, 'W' - white."
		4.times do |i|
			puts "Choose a color for slot #{i + 1}."
			@choices[i] = gets.chomp
			if (@choices[i] =~ /[B || G || R || P || O || W]/) == nil || @choices[i].size != 1
				puts "Invalid choice. Try again."
				puts "Color options: 'B' - blue, 'G' - green, 'R' - red, 'P' - purple, 'O' - orange, 'W' - white."
				redo
			end
		end
		puts "You entered: #{@choices[0]} #{@choices[1]} #{@choices[2]} #{@choices[3]}."
		@turn += 1
	end

	def feedback
		@feedback = Array.new(4)
		remaining_choices = @choices.dup
		remaining_code = @secret_code.dup
		4.times do |i|
			if @choices[i] == @secret_code[i]
				@feedback[i] = '!'
				remaining_choices[i] = nil
				remaining_code[i] = nil
			end
		end
		4.times do |i|
			if remaining_choices.any? { |element| element == remaining_code[i]}
				@feedback[i] ||= '*'
			end
		end
		@feedback = @feedback.compact.shuffle.join(' ')
	end

	def game_over?
		if @choices[0..3] == @secret_code[0..3]
			puts "You broke the secret code!" 
			puts "The secret code was #{@secret_code[0]} #{@secret_code[1]} #{@secret_code[2]} #{@secret_code[3]}"
			return true
		end

		if @turn == 12
			puts "You're out of turns!"
			puts "The secret code was #{@secret_code[0]} #{@secret_code[1]} #{@secret_code[2]} #{@secret_code[3]}"
			return true
		end
	end

	def game
		until game_over?
			make_guess
			feedback
			@game_board.update(@turn, @choices, @feedback)
			@game_board.display_board
		end
	end
end


codebreaker = HumanCodeBreaker.new