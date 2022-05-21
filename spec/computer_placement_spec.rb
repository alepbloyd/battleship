require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require 'rspec'
require 'pry'



RSpec.describe ComputerPlacement do

  it 'exists' do
    board = Board.new

    computer_placement = ComputerPlacement.new(board)

    expect(computer_placement).to be_instance_of(ComputerPlacement)
  end

  it 'returns horizontal placements for row by ship length' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)

    computer_placement = ComputerPlacement.new(board)

    expect(computer_placement.horizontal_placements(board,cruiser).count).to eq(8)

  end

end
