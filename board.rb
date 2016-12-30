class Board
	def initialize									#Create inital hash to represent open spaces ('X') on board
		@rows = Hash.new
		(12).downto(1) do |i|
			@rows["row_#{i}".to_sym] = ['X', 'X', 'X', 'X']		#Creates keys :row_1 - :row_12 each with value of array [X X X X]
		end
	end

	def display_board
		
		(12).downto(1) do |i|
			current_row = @rows["row_#{i}".to_sym]				#Temporary variable to shorten index for @rows hash
			print current_row[0] + ' ' + current_row[1] + ' ' + current_row[2] + ' ' + current_row[3]
			puts " Feedback: "
		end
	

	end
end

board = Board.new
board.display_board
