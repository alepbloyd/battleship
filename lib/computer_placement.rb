class ComputerPlacement

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def number_of_rows
    cells_key_array = []

    (@board.cells.keys).each do |key|
      cells_key_array << key[0]
    end

    unique_number_count = cells_key_array.uniq.count
    unique_number_count
  end

end
