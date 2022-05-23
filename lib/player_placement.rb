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
    return "You now need to lay out your #{@ships_to_be_placed.count} ships."
  end

end
