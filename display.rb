class Display
	def initialize									#Create inital hash to represent open spaces ('X') on board
		@board = Hash.new			#@board is a hash where the key is each row of the board and the value of each row is an array of each element
		(12).downto(1) do |i|
			@board["row_#{i}".to_sym] = ['X', 'X', 'X', 'X']		#Creates keys :row_1 - :row_12 each with value of array [X X X X]
		end
	end

	def display_board
		puts "Key: '!' = One of your choices is the correct color and position."
		puts "Key: '*' = One of your choices is the correct color but wrong position."
		puts '? ? ? ?'
		(12).downto(1) do |i|
			row_element = @board["row_#{i}".to_sym]			#Temporary variable to shorten index for @board hash. Each element is a space on that row
			puts "#{row_element[0]} #{row_element[1]} #{row_element[2]} #{row_element[3]} Feedback: #{row_element[4]}"
			end
	end

	def update(row_number, choices, feedback)		#Takes in the codebreaker's choices for the given row and updates game board
		current_row = "row_#{row_number}".to_sym
		4.times do |i|
			@board[current_row][i] = choices[i]
		end
		@board[current_row][4] = feedback
	end
end
