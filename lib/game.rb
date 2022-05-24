class Game

  def initialize
    @hits_by_player = 0
    @hits_by_computer = 0
    @player_board = ""
    @computer_board = ""
    @used_computer_board_cells = []
    @used_player_board_cells = []
  end

  def start_game
    @player_board = Board.new
    @computer_board = Board.new
    computer_placement = ComputerPlacement.new(@computer_board)
    player_placement = PlayerPlacement.new(@player_board)
    user_cruiser = Ship.new("Cruiser", 3)
    user_submarine = Ship.new("Submarine", 2)
    computer_cruiser = Ship.new("Cruiser",3)
    computer_submarine = Ship.new("Submarine",2)
    computer_placement.choose_valid_selection(@computer_board,computer_cruiser)
    computer_placement.choose_valid_selection(@computer_board,computer_submarine)
    player_placement.ship_input(user_cruiser)
    player_placement.ship_input(user_submarine)
    puts "I have laid out my ships on the grid."
    puts player_placement.opening_prompt
    puts
    puts player_placement.board.render
    puts
    puts player_placement.ship_instructions
    player_placement.check_user_input(player_placement.ships_to_be_placed[0])
    puts player_placement.board.render(true)
    puts player_placement.ship_instructions
    player_placement.check_user_input(player_placement.ships_to_be_placed[0])
    puts "COMPUTER BOARD"
    puts computer_placement.board.render(true)
    puts "PLAYER BOARD"
    puts player_placement.board.render(true)


  end

  def check_if_game_should_end
    @hits_by_player >= 5 || @hits_by_computer >= 5
  end

  def take_turn
    new_turn = Turn.new(@computer_board, @player_board)
    new_turn.current_boards_state
    new_turn.user_fire_on_cell
    new_turn.computer_fire_on_cell
    # if new_turn.shot_feedback_for_player == 
    puts new_turn.shot_feedback_for_player
    puts new_turn.shot_feedback_for_computer
    puts @computer_board.render(true)#take out
    puts
    puts @player_board.render(true)
    self.check_if_game_should_end
  end

  def game_over
    if @hits_by_player >= 5
      puts "GAME OVER, PLAYER WINS!!!"
    elsif @hits_by_computer >= 5
      puts "GAME OVER, COMPUTER WINS!!!"
    end
  end
end
