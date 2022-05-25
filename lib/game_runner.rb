require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require './lib/player_placement'
require './lib/game'

new_game = Game.new
new_game.start_game

while new_game.gameover == false do
  new_game.take_turn
end

new_game.game_over_text
