class ComputerPlacement

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def number_of_rows
    cells_letter_array = []

    (@board.cells.keys).each do |key|
      cells_letter_array << key[0]
    end

    unique_letter_count = cells_letter_array.uniq.count
    unique_letter_count
  end

  def number_of_columns
    cells_number_array = []

    (@board.cells.keys).each do |key|
      cells_number_array << key[1..-1]
    end

    unique_number_count = cells_number_array.uniq.count
    unique_number_count
  end

end
