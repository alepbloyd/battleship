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

end
