class HumanBreaker
	def make_guess
		puts "Color options: 'B' - blue, 'G' - green, 'R' - red, 'P' - purple, 'O' - orange, 'W' - white."
		choices = Array.new(4)
		4.times do |i|
			puts "Choose a color for hole #{i + 1}."
			choices[i] = gets.chomp