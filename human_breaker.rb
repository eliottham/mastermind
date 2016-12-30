class HumanBreaker
	def make_guess
		puts "Color options: 'B' - blue, 'G' - green, 'R' - red, 'P' - purple, 'O' - orange, 'W' - white."
		choices = Array.new(4)
		4.times do |i|
			puts "Choose a color for slot #{i + 1}."
			choices[i] = gets.chomp
			if (choices[i] =~ /[B || G || R || P || O || W]/) == nil
				puts "Invalid choice. Try again."
				redo
			end
		end
		puts "You entered: #{choices[0]} #{choices[1]} #{choices[2]} #{choices[3]}."
		return choices
	end
end

me = HumanBreaker.new
me.make_guess
