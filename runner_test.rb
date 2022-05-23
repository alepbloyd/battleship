require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require './lib/player_placement'
require './lib/turn'
require 'rspec'
require 'pry'

player_board = Board.new

computer_board = Board.new

computer_placement = ComputerPlacement.new(computer_board)

player_placement = PlayerPlacement.new(player_board)

user_cruiser = Ship.new("Cruiser", 3)
user_submarine = Ship.new("Submarine", 2)

computer_cruiser = Ship.new("Cruiser",3)
computer_submarine = Ship.new("Submarine",2)

computer_placement.choose_valid_selection(computer_board,computer_cruiser)
computer_placement.choose_valid_selection(computer_board,computer_submarine)

player_placement.ship_input(user_cruiser)
player_placement.ship_input(user_submarine)

puts "I have laid out my ships on the grid."

puts player_placement.opening_prompt

puts

puts player_placement.board.render

puts

puts player_placement.ship_instructions

player_placement.check_user_input(player_placement.ships_to_be_placed[0])

puts

puts player_placement.board.render(true)

puts

puts player_placement.ship_instructions

player_placement.check_user_input(player_placement.ships_to_be_placed[0])

puts "COMPUTER BOARD"

puts computer_placement.board.render(true)

puts "PLAYER BOARD"

puts player_placement.board.render(true)

turn1 = Turn.new(computer_board,player_board)

puts turn1.current_boards_state

turn1.user_fire_on_cell

turn1.computer_fire_on_cell

puts computer_placement.board.render(true)

puts player_placement.board.render(true)

puts turn1.shot_feedback_for_player
