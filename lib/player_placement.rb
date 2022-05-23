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
    return "You now need to lay out your #{@ships_to_be_placed.length} ships.\n The #{@ships_to_be_placed[0].name} is #{@ships_to_be_placed[0].length} units long and the #{@ships_to_be_placed[1].name} is #{@ships_to_be_placed[1].length} units long."
  end

  def display_board(render_status = false)
    @board.render
  end

  def ship_instructions
    "Enter the squares for the #{@ships_to_be_placed[0].name} (#{@ships_to_be_placed[0].length} spaces):"
  end

  def user_input_array(input)
    input = gets.chomp
    input.split(" ")
  end

  def check_user_input(ship, input_array)
    check_input = user_input_array(input_array)
    while @board.valid_placement?(ship, check_input) == false do
      puts "Those are invalid coordinates. Please try again:"
      check_input = user_input_array(input_array)
    end
    @board.place(ship, check_input)
    @ships_to_be_placed.shift



    # if @board.valid_placement?(ship, check_input)
    #   @board.place(ship, check_input)
    #   @ships_to_be_placed.shift
    # else
    #   "Those are invalid coordinates. Please try again:"
    # end
  end
  def place_ship
    @board.place(ship, input_array)
  end

end
