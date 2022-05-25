class PlayerPlacement

  attr_reader :board, :ships_to_be_placed

  def initialize(board)
    @board = board
    @ships_to_be_placed = []
  end

  def ship_input(ship)
    @ships_to_be_placed << ship
  end

  def opening_prompt
    return "You now need to lay out your #{@ships_to_be_placed.length} ships.\n \nThe #{@ships_to_be_placed[0].name} is #{@ships_to_be_placed[0].length} units long and the #{@ships_to_be_placed[1].name} is #{@ships_to_be_placed[1].length} units long."
  end

  def display_board(render_status = false)
    @board.render
  end

  def ship_instructions
    "Enter the sectors for the #{@ships_to_be_placed[0].name} (#{@ships_to_be_placed[0].length} spaces) in 'A1 B1 format':"
  end

  def player_input_array
    input = gets.upcase.chomp
    input.split(" ")
  end

  def check_player_input(ship)
    # check_input = player_input_array

    input = gets.chomp

    input_array = input.split(" ")

    if input.downcase == "i surrender!"
      exit
    end

    while input.split(" ").class != Array
      puts "That is an invalid input!"
      puts "Please enter in 'A1 A2 A3' format"
      input = gets.chomp
      input_array = input.split(" ")
    end

    while @board.valid_placement?(ship, input_array) == false do
      puts "Those are invalid coordinates. Please try again:"
      input = gets.chomp
      input_array = input.split(" ")
    end

    @board.place(ship, input_array)
    @ships_to_be_placed.shift
  end

  def place_ship
    @board.place(ship, input_array)
  end

end
