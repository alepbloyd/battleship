require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require './lib/player_placement'
require './lib/turn'
require './lib/game'
require 'rspec'
require 'pry'

new_game = Game.new
new_game.start_game

while new_game.check_if_game_should_end == false do
  new_game.take_turn
end
new_game.game_over
