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
    submarine = Ship.new("Submarine", 2)

    computer_placement = ComputerPlacement.new(board)

    expect(computer_placement.horizontal_placements(board,cruiser).count).to eq(8)

    expect(computer_placement.horizontal_placements(board,submarine).count).to eq(12)

  end

  it 'returns vertical placements for column by ship length' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer_placement = ComputerPlacement.new(board)

    expect(computer_placement.vertical_placements(board,cruiser).count).to eq(8)

    expect(computer_placement.vertical_placements(board,submarine).count).to eq(12)

  end

  it 'returns array of combined valid placements' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer_placement = ComputerPlacement.new(board)

    expect(computer_placement.combined_valid_placements(board,cruiser).count).to eq(16)
  end

  

end
