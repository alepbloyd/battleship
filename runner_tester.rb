require "./lib/ship"
require "./lib/board"
require "./lib/cell"
require "./lib/computer"
require "pry"

board = Board.new

board.get_board_size

cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)

computer = Computer.new(board)

placement1 = computer.choose_valid_selection(board,cruiser)

placement2 = computer.choose_valid_selection(board,submarine)

board.place(cruiser,placement1)
board.place(submarine,placement2)

puts board.render(true)
