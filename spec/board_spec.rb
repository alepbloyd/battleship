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
    cruiser_1 = Ship.new("Cruiser", 3)
    cruiser_2 = Ship.new("Cruiser", 3)
    submarine_1 = Ship.new("Submarine", 2)
    submarine_2 = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser_1, ["A1", "A2"])).to be false
    expect(board.valid_placement?(submarine_1, ["A2", "A3", "A4"])).to be false
    expect(board.valid_placement?(submarine_2, ["A2", "A3"])).to be true
    expect(board.valid_placement?(cruiser_2, ["A1", "A2", "A4"])).to be false
  end

  it "checks if coordinates are consecutive" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
    expect(board.valid_placement?(submarine,["C1", "B1"])).to be false

    expect(board.valid_placement?(submarine,["A1", "A2"])).to be true
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be true
    expect(board.valid_placement?(submarine,["B1","B2"])). to be true

  end

  it 'checks that coordinates are not diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false

    expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false
  end

  it 'can place ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)

    expect(cell_3.ship == cell_2.ship).to be true

  end

  it "doesn't allow overlapping ship placements" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    submarine = Ship.new("Submarine", 2)
    submarine_2 = Ship.new("Submarine", 2)
    submarine_3 = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1","B1"])).to be false
    expect(board.valid_placement?(submarine_2, ["A1","A2"])).to be false
    expect(board.valid_placement?(submarine_3, ["D1","D2"])).to be true
  end

  it "renders with '.' when initiated" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.render

    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end


end
