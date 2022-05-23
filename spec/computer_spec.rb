require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'rspec'
require 'pry'

#these were working, all of them broke when I implemented custom board size. All of the functionality is still good, but I'm not sure what to do about the tests here now that they rely on user input

RSpec.describe Computer do

  it 'exists' do
    board = Board.new

    computer = Computer.new(board)

    expect(computer).to be_instance_of(Computer)
  end

  it 'returns horizontal placements for row by ship length' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer = Computer.new(board)

    expect(computer.horizontal_placements(board,cruiser).count).to eq(8)

    expect(computer.horizontal_placements(board,submarine).count).to eq(12)

  end

  it 'returns vertical placements for column by ship length' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer = Computer.new(board)

    expect(computer.vertical_placements(board,cruiser).count).to eq(8)

    expect(computer.vertical_placements(board,submarine).count).to eq(12)

  end

  it 'returns array of combined valid placements' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer = Computer.new(board)

    expect(computer.combined_valid_placements(board,cruiser).count).to eq(16)
    expect(computer.combined_valid_placements(board,submarine).count).to eq(24)
  end

  it 'selects a random valid placement' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)

    computer = Computer.new(board)

    expect(computer.choose_valid_selection(board,cruiser).count).to eq(3)
  end

  it 'removes options from valid placement array when ship is placed' do
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer = Computer.new(board)

    first_placement = computer.choose_valid_selection(board,cruiser)

    expect(computer.combined_valid_placements(board,submarine).count).to be < 24
  end

end
