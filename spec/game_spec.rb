require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require './lib/player_placement'
require './lib/game'
require 'rspec'
require 'pry'



RSpec.describe Game do

  it 'exists' do
    new_game = Game.new

    expect(new_game).to be_instance_of(Game)
  end

  it 'initializes with player board and computer_board' do
    new_game = Game.new

    expect(new_game.player_board).to be_instance_of(Board)
    expect(new_game.computer_board).to be_instance_of(Board)
  end

  it 'initializes with ships to place' do
    new_game = Game.new

    expect(new_game.player_cruiser).to be_instance_of(Ship)
    expect(new_game.player_submarine).to be_instance_of(Ship)

    expect(new_game.computer_cruiser).to be_instance_of(Ship)
    expect(new_game.computer_submarine).to be_instance_of(Ship)
  end

  it 'checks if input can be turned to integer' do
    new_game = Game.new

    expect(new_game.convertible_to_integer?("6")).to eq(true)

    expect(new_game.convertible_to_integer?("string")).to eq(false)
  end


end
