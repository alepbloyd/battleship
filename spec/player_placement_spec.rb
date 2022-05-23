require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require './lib/player_placement'
require 'rspec'
require 'pry'

RSpec.describe PlayerPlacement do
  it 'exists' do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    expect(player_placement).to be_instance_of(PlayerPlacement)
  end

  it 'returns array of ships to be placed' do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_placement.ship_input(cruiser)
    player_placement.ship_input(submarine)
    expect(player_placement.ships_to_be_placed).to eq([cruiser, submarine])
  end

  it 'tells player how many ships to place' do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_placement.ship_input(cruiser)
    player_placement.ship_input(submarine)
    expect(player_placement.opening_prompt).to eq("You now need to lay out your 2 ships.")
  end

  xit "provides instructions by ship" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    expect()

  end
end
