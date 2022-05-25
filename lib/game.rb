class Game

  attr_reader :hits_by_player, :hits_by_computer, :player_board, :computer_board, :computer_placement, :player_placement, :user_cruiser, :user_submarine, :computer_cruiser, :computer_submarine, :gameover

  def initialize

    @player_board = Board.new
    @computer_board = Board.new
    @computer_placement = ComputerPlacement.new(@computer_board)
    @player_placement = PlayerPlacement.new(@player_board)
    @user_cruiser = Ship.new("Explorer 1", 3)
    @user_submarine = Ship.new("Drone", 2)
    @computer_cruiser = Ship.new("Sputnick",3)
    @computer_submarine = Ship.new("Drone",2)
    @gameover = false
    @used_computer_board_cells = []
    @used_player_board_cells = []
    @computer_cells_array = ["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"]
    @user_cells_array = ["A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"]
    @start_the_game = false
  end

  def start_game

    puts "Welcome to SPACERACE!"
    puts
    puts "Featuring USA(user) vs USSR(computer)"
    puts
    puts "Enter: p to LAUNCH. Enter: q to SURRENDER."
    puts
    puts "You may exit this journey at anytime by entering: quit!"
    puts
    start_choice = gets.chomp

    if start_choice == "quit!"
      exit
    end

    while start_choice != "p" && start_choice != "q" do
      puts "p to play, q to quit."
      start_choice = gets.chomp
    end

    if start_choice == "q"
      exit
    end

    @computer_placement.choose_valid_selection(@computer_board,@computer_cruiser)
    @computer_placement.choose_valid_selection(@computer_board,@computer_submarine)
    @player_placement.ship_input(@user_cruiser)
    @player_placement.ship_input(@user_submarine)
    puts "My satellites have launched and are ready for battle!"
    puts
    puts @player_placement.opening_prompt
    puts
    puts @player_placement.board.render
    puts
    puts @player_placement.ship_instructions
    @player_placement.check_user_input(@player_placement.ships_to_be_placed[0])
    puts
    puts @player_placement.board.render(true)
    puts
    puts @player_placement.ship_instructions
    puts
    @player_placement.check_user_input(@player_placement.ships_to_be_placed[0])
    puts
    puts "----- USSR BOARD -----"
    puts
    puts @computer_placement.board.render(true)
    puts
    puts "----- USA BOARD -----"
    puts
    puts @player_placement.board.render(true)
    puts
  end

  def take_turn
    new_turn = Turn.new(@computer_board, @player_board)

    new_turn.current_boards_state

    puts "Enter the coordinates for your shot:"
    user_input = gets.chomp
    if user_input == "quit!"
      exit
    end

    while @computer_board.valid_coordinate?(user_input) == false || @used_computer_board_cells.include?(user_input) do
      if @computer_board.valid_coordinate?(user_input)
        puts "Please enter a valid coordinate:"
      elsif @used_computer_board_cells.include?(user_input)
        puts "Wake up! You have already performed a shot on this coordinate."
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
    puts
    if @computer_board.cells[previous_shot].render == "H"
      puts "Your shot on #{previous_shot} was a hit."
    elsif @computer_board.cells[previous_shot].render == "M"
      puts "Your shot on #{previous_shot} was a miss."
    elsif @computer_board.cells[previous_shot].render == "X"
      puts "Your shot on #{previous_shot} has eliminated a satellite! Keep it up!!!"
    end
    puts
    previous_shot = @used_player_board_cells.last
    if @player_board.cells[previous_shot].render == "H"
      puts "USSR shot on #{previous_shot} was a hit."
    elsif @player_board.cells[previous_shot].render == "M"
      puts "USSR shot on #{previous_shot} was a miss."
    elsif @player_board.cells[previous_shot].render == "X"
      puts "USSR shot on #{previous_shot} Oh no, we lost a satellite! Get it together!!!"
    end
    puts
    puts "----- USSR BOARD -----"
    puts
    puts @computer_board.render(true)#take out
    puts
    puts "----- USA BOARD -----"
    puts
    puts @player_board.render(true)
    puts
    if @computer_cruiser.sunk? == true && @computer_submarine.sunk? == true
      @gameover = true
      puts "GAME OVER, USA WINS!!!"
    elsif @user_cruiser.sunk? == true && @user_submarine.sunk? == true
      @gameover = true
      puts "GAME OVER, USSR WINS!!!"
    end
  end

  def game_over_text
    puts "This race has ended, History has been written."
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
