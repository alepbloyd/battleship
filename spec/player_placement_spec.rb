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
    expect(player_placement.opening_prompt).to eq("You now need to lay out your 2 ships.\n The Cruiser is 3 units long and the Submarine is 2 units long.")
  end

  it "displays rendered board" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    expect(player_placement.display_board).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end
  it "provides instructions for each ship" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player_placement.ship_input(cruiser)
    player_placement.ship_input(submarine)
    expect(player_placement.ship_instructions).to eq("Enter the squares for the Cruiser (3 spaces):")
  end
  it "formats user input to an array" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    user_input = "A1 A2 A3"
    expect(player_placement.user_input_array(user_input)).to eq(["A1", "A2", "A3"])
  end
  xit "checks user placement validity" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    user_input = "A1 A2 A3"
    expect(player_placement.check_user_input(cruiser, user_input)).to be(true)
  end
  it "rejects invalid placement" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    user_input = "A1 A2 A4"
    player_placement.check_user_input(cruiser, user_input)
      expect(player_placement.check_user_input(cruiser, user_input)).to eq("Those are invalid coordinates. Please try again:")
  end
  it "renders valid placement on the board" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    user_input = "A1 A2 A3"
    player_placement.check_user_input(cruiser, user_input)
    expect(player_placement.board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
  it "removes availibility of a placed ship from the array" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    user_input = "A1 A2 A3"
    player_placement.ship_input(cruiser)
    player_placement.ship_input(submarine)
    player_placement.check_user_input(cruiser, user_input)
    expect(player_placement.ships_to_be_placed).to eq([submarine])
  end
  it "promps for next ship placement" do
    board = Board.new
    player_placement = PlayerPlacement.new(board)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    user_input_1 = "A1 A2 A3"
    user_input_2 = "B1 B2"
    player_placement.ship_input(cruiser)
    player_placement.ship_input(submarine)
    player_placement.check_user_input(cruiser, user_input_1)
    expect(player_placement.ship_instructions).to eq("Enter the squares for the Submarine (2 spaces):")

  end


end
