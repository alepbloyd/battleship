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

puts turn1.shot_feedback_for_computer

turn2 = Turn.new(computer_board,player_board)

puts turn2.current_boards_state

turn2.user_fire_on_cell

turn2.computer_fire_on_cell

puts computer_placement.board.render(true)

puts player_placement.board.render(true)

puts turn2.shot_feedback_for_player

puts turn2.shot_feedback_for_computer

turn3 = Turn.new(computer_board,player_board)

puts turn3.current_boards_state

turn3.user_fire_on_cell

turn3.computer_fire_on_cell

puts computer_placement.board.render(true)

puts player_placement.board.render(true)

puts turn3.shot_feedback_for_player

puts turn3.shot_feedback_for_computer

puts turn3.check_if_game_should_end

turn4 = Turn.new(computer_board,player_board)

puts turn4.current_boards_state

turn4.user_fire_on_cell

turn4.computer_fire_on_cell

puts computer_placement.board.render(true)

puts player_placement.board.render(true)

puts turn4.shot_feedback_for_player

puts turn4.shot_feedback_for_computer

puts turn4.check_if_game_should_end

turn5 = Turn.new(computer_board,player_board)

binding.pry

puts turn5.current_boards_state

turn5.user_fire_on_cell

turn5.computer_fire_on_cell

puts computer_placement.board.render(true)

puts player_placement.board.render(true)

puts turn5.shot_feedback_for_player

puts turn5.shot_feedback_for_computer

puts turn5.check_if_game_should_end


turn6 = Turn.new(computer_board,player_board)



puts turn6.current_boards_state

turn6.user_fire_on_cell

turn6.computer_fire_on_cell

puts computer_placement.board.render(true)

puts player_placement.board.render(true)

puts turn6.shot_feedback_for_player

puts turn6.shot_feedback_for_computer
