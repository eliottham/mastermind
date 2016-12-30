class HumanCodeBreaker
require_relative 'display'
	def initialize
		puts "Break the computer's secret code: ? ? ? ?"
		@secret_code = ['B', 'G', 'R', 'P', 'O', 'W'].sample(4)
		puts @secret_code
		@secret_code = ['W', 'W', 'B', 'B']
		@turn = 0
		@game_board = Display.new
		game
	end

	def make_guess
		puts "Color options: 'B' - blue, 'G' - green, 'R' - red, 'P' - purple, 'O' - orange, 'W' - white."
		@choices = Array.new(4)
		4.times do |i|
			puts "Choose a color for slot #{i + 1}."
			@choices[i] = gets.chomp
			if (@choices[i] =~ /[B || G || R || P || O || W]/) == nil
				puts "Invalid choice. Try again."
				puts "Color options: 'B' - blue, 'G' - green, 'R' - red, 'P' - purple, 'O' - orange, 'W' - white."
				redo
			end
		end
		puts "You entered: #{@choices[0]} #{@choices[1]} #{@choices[2]} #{@choices[3]}."
		@turn += 1
	end

	def feedback
		@feedback = Array.new
		for i in 0...4 
			if @choices[i] == @secret_code[i]
				@feedback.push('!')
			elsif @choices.any? { |element| element == @secret_code[i] }
				@feedback.push('*')
			end
		end
		@feedback = @feedback.shuffle.join(" ")
	end

	def game
		make_guess
		feedback
		@game_board.update(@turn, @choices, @feedback)
		@game_board.display_board
	end

	


end


game = HumanCodeBreaker.new