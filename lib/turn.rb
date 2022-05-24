require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_placement'
require './lib/player_placement'
require 'rspec'
require 'pry'

class Turn

  attr_reader :computer_board, :player_board, :used_computer_board_cells, :used_player_board_cells, :computer_cells_array, :user_cells_array, :hits_by_player, :hits_by_computer

  def initialize(computer_board,player_board)
    @computer_board = computer_board
    @player_board = player_board
    @used_computer_board_cells = []
    @used_player_board_cells = []
    @computer_cells_array = ["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"]
    @user_cells_array = ["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"]
  end

  def current_boards_state
    "COMPUTER BOARD" + "\n" +
    "#{@computer_board.render}" +
    "PLAYER BOARD" + "\n" +
    "#{@player_board.render(true)}"
  end

  def user_fire_on_cell
    puts "Enter the coordinate for your shot:"
    user_input = gets.chomp

    while @computer_board.valid_coordinate?(user_input) == false || @used_computer_board_cells.include?(user_input) do
      if @computer_board.valid_coordinate?(user_input)
        puts "Please enter a valid coordinate:"
      elsif @used_computer_board_cells.include?(user_input)
        puts "Oops you already shot there"
      end
      user_input = gets.chomp
    end

    @computer_cells_array.delete(user_input)
    @used_computer_board_cells << user_input
    @computer_board.cells[user_input].fire_upon
    user_input
  end

  def computer_fire_on_cell
    random_selection = @user_cells_array.sample
    @user_cells_array.delete(random_selection)
    @used_player_board_cells << random_selection
    @player_board.cells[random_selection].fire_upon

    random_selection
  end

  def shot_feedback_for_player
    previous_shot = @used_computer_board_cells.last

    if @computer_board.cells[previous_shot].render == "H"
      "Your shot on #{previous_shot} was a hit."
    elsif @computer_board.cells[previous_shot].render == "M"
      "Your shot on #{previous_shot} was a miss."
    elsif @computer_board.cells[previous_shot].render == "X"
      "Your shot on #{previous_shot} sunk the ship. Woo!"
    end
  end

  def shot_feedback_for_computer
    previous_shot = @used_player_board_cells.last

    if @player_board.cells[previous_shot].render == "H"
      "My shot on #{previous_shot} was a hit."
    elsif @player_board.cells[previous_shot].render == "M"
      "My shot on #{previous_shot} was a miss."
    elsif @player_board.cells[previous_shot].render == "X"
      "My shot on #{previous_shot} sunk the ship. Woo!"
    end
  end

end
