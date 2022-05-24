class Game

  attr_reader :hits_by_player, :hits_by_computer, :player_board, :computer_board, :computer_placement, :player_placement, :user_cruiser, :user_submarine, :computer_cruiser, :computer_submarine, :gameover

  def initialize

    @player_board = Board.new
    @computer_board = Board.new
    @computer_placement = ComputerPlacement.new(@computer_board)
    @player_placement = PlayerPlacement.new(@player_board)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser",3)
    @computer_submarine = Ship.new("Submarine",2)
    @gameover = false
    @used_computer_board_cells = []
    @used_player_board_cells = []
    @computer_cells_array = ["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"]
    @user_cells_array = ["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"]
    @start_the_game = false
  end

  def start_game
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    puts "Enter quit! at anytime to leave the game"
    start_choice = gets.chomp
    if start_choice == "quit!"
      exit
    end
    while start_choice != "p" && start_choice != "q" do
      puts "Invalid selection"
      start_choice = gets.chomp
    end
    if start_choice == "q"
      exit
    end

    @computer_placement.choose_valid_selection(@computer_board,@computer_cruiser)
    @computer_placement.choose_valid_selection(@computer_board,@computer_submarine)
    @player_placement.ship_input(@user_cruiser)
    @player_placement.ship_input(@user_submarine)
    puts "I have laid out my ships on the grid."
    puts @player_placement.opening_prompt
    puts
    puts @player_placement.board.render
    puts
    puts @player_placement.ship_instructions
    @player_placement.check_user_input(@player_placement.ships_to_be_placed[0])
    puts @player_placement.board.render(true)
    puts @player_placement.ship_instructions
    @player_placement.check_user_input(@player_placement.ships_to_be_placed[0])
    puts "COMPUTER BOARD"
    puts @computer_placement.board.render(true)
    puts "PLAYER BOARD"
    puts @player_placement.board.render(true)
  end

  def take_turn
    new_turn = Turn.new(@computer_board, @player_board)

    new_turn.current_boards_state

    puts "Enter the coordinate for your shot:"
    user_input = gets.chomp
    if user_input == "quit!"
      exit
    end

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
    @computer_cells_array.delete(user_input)
    @used_computer_board_cells << user_input
    computer_choice = @user_cells_array.sample
    @user_cells_array.delete(computer_choice)
    @used_player_board_cells << computer_choice
    @player_board.cells[computer_choice].fire_upon
    previous_shot = @used_computer_board_cells.last
    if @computer_board.cells[previous_shot].render == "H"
      puts "Your shot on #{previous_shot} was a hit."
    elsif @computer_board.cells[previous_shot].render == "M"
      puts "Your shot on #{previous_shot} was a miss."
    elsif @computer_board.cells[previous_shot].render == "X"
      puts "Your shot on #{previous_shot} sunk the ship. Woo!"
    end
    previous_shot = @used_player_board_cells.last
    if @player_board.cells[previous_shot].render == "H"
      puts "My shot on #{previous_shot} was a hit."
    elsif @player_board.cells[previous_shot].render == "M"
      puts "My shot on #{previous_shot} was a miss."
    elsif @player_board.cells[previous_shot].render == "X"
      puts "My shot on #{previous_shot} sunk the ship. Woo!"
    end
    puts @computer_board.render(true)#take out
    puts
    puts @player_board.render(true)
    if @computer_cruiser.sunk? == true && @computer_submarine.sunk? == true
      @gameover = true
      puts "GAME OVER, PLAYER WINS!!!"
    elsif @user_cruiser.sunk? == true && @user_submarine.sunk? == true
      @gameover = true
      puts "GAME OVER, COMPUTER WINS!!!"
    end
  end

  def game_over_text
    puts "The game is over."
    sleep(3)

    puts "Play again?"
    puts "Enter p to play. Enter q to quit"
    start_choice = gets.chomp
    while start_choice != "p" && start_choice != "q" do
      puts "Invalid selection"
      start_choice = gets.chomp
    end
    if start_choice == "q"
      exit
    end
    system("ruby ./lib/game_runner.rb")
  end
end
