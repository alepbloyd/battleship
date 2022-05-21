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

  it 'returns number of rows on board' do
    board = Board.new

    computer_placement = ComputerPlacement.new(board)

    expect(computer_placement.number_of_rows).to eq(4)
  end

  it 'returns number of columns on board' do
    board = Board.new

    computer_placement = ComputerPlacement.new(board)

    expect(computer_placement.number_of_columns).to eq(4)
  end

end
