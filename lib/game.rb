class Game

  attr_reader :hits_by_player, :hits_by_computer, :player_board, :computer_board, :computer_placement, :player_placement, :player_cruiser, :player_submarine, :computer_cruiser, :computer_submarine, :gameover, :number_of_rows, :number_of_columns, :rows_array, :columns_array, :cells_array

  def initialize
    @player_board = Board.new
    @computer_board = Board.new

    @computer_placement = ComputerPlacement.new(@computer_board)
    @player_placement = PlayerPlacement.new(@player_board)

    @player_cruiser = Ship.new("Explorer 1", 3)
    @player_submarine = Ship.new("Drone", 2)

    @computer_cruiser = Ship.new("Sputnik 1",3)
    @computer_submarine = Ship.new("Drone",2)

    @gameover = false

    @used_computer_board_cells = []
    @used_player_board_cells = []
    @computer_cells_array = []
    @player_cells_array = []

    @cells_array = []

    @number_of_rows = 0
    @number_of_columns = 0

    @rows_array = []
    @columns_array= []
  end

  def convertible_to_integer?(string)
    string.to_i.to_s == string
  end

  def set_board_size
    puts "Please enter horizontal lunar miles for battle:"

    rows_input = gets.downcase.chomp

    if rows_input == "i surrender!"
      exit
    end

    while convertible_to_integer?(rows_input) == false do
      puts "Invalid input! Please enter a positive integer!"
      rows_input = gets.chomp
    end
    puts "**" * 20
    puts
    puts "Please enter vertical lunar miles for battle"

    columns_input = gets.chomp

    if columns_input == "i surrender!"
      exit
    end

    while convertible_to_integer?(columns_input) == false do
      puts "Invalid input! Please enter a positive integer!"
      columns_input = gets.chomp
    end

    @number_of_rows = rows_input.to_i
    @number_of_columns = columns_input.to_i

    @computer_board.number_of_rows = @number_of_rows
    @player_board.number_of_rows = @number_of_rows

    @computer_board.number_of_columns = @number_of_columns
    @player_board.number_of_columns = @number_of_columns

    @columns_array = (1..@number_of_columns).to_a
    @rows_array = ("A"..(65 + @number_of_rows - 1).chr).to_a

    @computer_board.columns_array = @columns_array
    @player_board.columns_array = @columns_array

    @computer_board.rows_array = @rows_array
    @player_board.rows_array = @rows_array

    @rows_array.each do |letter|
      @columns_array.each do |number|
        @cells_array << "#{letter}#{number}"
        @computer_cells_array << "#{letter}#{number}"
        @player_cells_array << "#{letter}#{number}"
        @player_board.cells_array << "#{letter}#{number}"
        @computer_board.cells_array << "#{letter}#{number}"
      end
    end

    @cells_array.each do |cell|
      player_board.cells[cell] = Cell.new(cell)
      computer_board.cells[cell] = Cell.new(cell)
    end
  end

  def start_game
    puts
    puts "**" * 4 + "  Welcome to SPACERACE!  " + "**" * 4
    puts
    sleep(1)
    puts
    puts "+x" * 8 + "  U S A  " + "+x" * 8
    puts
    sleep(0.4)
    puts
    puts"**" * 8 + "   VS   " + "**" * 8
    puts
    sleep(0.4)
    puts
    puts "+x" * 7 + "  U S S R  " + "+x" * 8
    puts
    sleep(0.4)
    puts
    puts "**" * 20
    sleep(1)
    puts
    puts "You may exit this journey at anytime by entering:"
    puts
    puts
    puts "`I surrender!`"
    puts
    puts
    puts "**" * 20
    puts
    puts
    puts "Enter: LAUNCH to LAUNCH."
    puts "Enter: SURRENDER to SURRENDER."
    puts
    puts "**" * 22
    start_choice = gets.downcase.chomp

    if start_choice == "surrender" || start_choice == "i surrender!"
      puts "coward"
      sleep(2)
      exit
    end

    while start_choice != "launch" && start_choice != "surrender" do
      puts "'#{start_choice}' is not 'LAUNCH' or 'SURRENDER'"
      start_choice = gets.downcase.chomp
    end

    puts
    set_board_size
    puts

    place_all_ships
    puts
    puts "* My satellites have launched and are ready for battle! *"
    puts
    puts @player_placement.opening_prompt
    puts
    puts @player_placement.board.render
    puts
    puts @player_placement.ship_instructions
    @player_placement.check_player_input(@player_placement.ships_to_be_placed[0])
    puts
    puts @player_placement.board.render(true)
    puts
    puts @player_placement.ship_instructions
    puts
    @player_placement.check_player_input(@player_placement.ships_to_be_placed[0])
    puts
    puts "***** USSR BOARD *****"
    puts
    puts @computer_placement.board.render
    puts
    puts "+++++ USA BOARD +++++"
    puts
    puts @player_placement.board.render(true)
    puts
  end

  def place_all_ships
    @computer_placement.choose_valid_selection(@computer_board,@computer_cruiser)
    @computer_placement.choose_valid_selection(@computer_board,@computer_submarine)
    @player_placement.ship_input(@player_cruiser)
    @player_placement.ship_input(@player_submarine)
  end

  def take_turn
    puts "Enter the coordinates for your shot:"
    player_input = gets.chomp.upcase

    if player_input.downcase == "i surrender!"
      exit
    end

    while @computer_board.valid_coordinate?(player_input) == false || @used_computer_board_cells.include?(player_input) do
      if @computer_board.valid_coordinate?(player_input) == false
        puts "Please enter a valid coordinate:"
        player_input = gets.chomp.upcase
        if player_input == "i surrender!"
          exit
        end
      elsif @used_computer_board_cells.include?(player_input)
        puts "Wake up! You have already performed a shot on this coordinate."
        player_input = gets.chomp.upcase
        if player_input == "i surrender!"
          exit
        end
      end
    end

    @computer_cells_array.delete(player_input)
    @used_computer_board_cells << player_input
    @computer_board.cells[player_input].fire_upon
    @computer_cells_array.delete(player_input)
    @used_computer_board_cells << player_input
    computer_choice = @player_cells_array.sample
    @player_cells_array.delete(computer_choice)
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
    puts @computer_board.render
    puts
    puts "----- USA BOARD -----"
    puts
    puts @player_board.render(true)
    puts
    check_for_game_over
  end

  def check_for_game_over
    if @computer_cruiser.sunk? == true && @computer_submarine.sunk? == true
      @gameover = true
      puts "GAME OVER, USA WINS!!!"
    elsif @player_cruiser.sunk? == true && @player_submarine.sunk? == true
      @gameover = true
      puts "GAME OVER, USSR WINS!!!"
    end
  end

  def game_over_text
    puts "This race has ended, History has been written."

    sleep(3)

    puts "Play again?"
    puts "Enter p to play. Enter q to quit"

    start_choice = gets.downcase.chomp

    while start_choice != "p" && start_choice != "q" do
      puts "Invalid selection"
      start_choice = gets.downcase.chomp
    end

    if start_choice == "q"
      exit
    end

    system("ruby ./lib/game_runner.rb")
  end
end
