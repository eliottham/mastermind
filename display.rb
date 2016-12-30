class Display
	def initialize									#Create inital hash to represent open spaces ('X') on board
		@board = Hash.new
		(12).downto(1) do |i|
			@board["row_#{i}".to_sym] = ['X', 'X', 'X', 'X', 'Feedback:']		#Creates keys :row_1 - :row_12 each with value of array [X X X X]
		end
	end

	def display_board

		(12).downto(1) do |i|
			row_element = @board["row_#{i}".to_sym]			#Temporary variable to shorten index for @board hash. Each element is a space on that row
			puts row_element[0] + ' ' + row_element[1] + ' ' + row_element[2] + ' ' + row_element[3] + ' ' + row_element[4]
			end
	end

	def update_board(row_number, choices, feedback)		#Takes in the codebreaker's choices for the given row and updates game board
		current_row = "row_#{row_number}".to_sym
		4.times do |i|
			@board[current_row][i] = choices[i]
		end
	end




end

board = Display.new
#board.display_board
array = ['B', 2.to_s, 3.to_s, 4.to_s]
board.update_board(1, array, 1)
board.display_board