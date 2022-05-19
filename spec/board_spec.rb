require './lib/ship'
require './lib/cell'
require './lib/board'
require 'rspec'
require 'pry'



RSpec.describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'has a hash of 16 cells' do
    board = Board.new

    expect(board.cells.length).to eq(16)
  end

  it 'returns true for valid coordinate' do
    board = Board.new

    board.cells

    expect(board.valid_coordinate?("A1")).to be true
  end

  it 'returns true/false depending on coordinate validity' do
    board = Board.new

    board.cells

    expect(board.valid_coordinate?("A1")).to be true
    expect(board.valid_coordinate?("D4")).to be true
    expect(board.valid_coordinate?("A5")).to be false
    expect(board.valid_coordinate?("E1")).to be false
    expect(board.valid_coordinate?("A22")).to be false
  end

  it "checks placement length validity" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

     expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
     expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
      expect(board.valid_placement?(submarine, ["A2", "A3"])).to be true

  end

end
