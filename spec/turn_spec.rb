require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require './lib/player_placement'
require './lib/turn'
require 'rspec'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    computer_board = Board.new
    player_board = Board.new

    computer_placement = ComputerPlacement.new(computer_board)
    player_placement = PlayerPlacement.new(player_board)

    turn = Turn.new(computer_board,player_board)

    expect(turn).to be_instance_of(Turn)
  end

  it 'displays computer and player boards' do
    computer_board = Board.new
    player_board = Board.new

    computer_placement = ComputerPlacement.new(computer_board)
    player_placement = PlayerPlacement.new(player_board)

    turn = Turn.new(computer_board,player_board)

    expect(turn.current_boards_state).to eq(("COMPUTER BOARD" + "\n" +
      "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n" +
      "PLAYER BOARD" + "\n" +
      "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      ))
  end

end
