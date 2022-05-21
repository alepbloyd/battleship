require 'pry'

class ComputerPlacement

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def horizontal_placements(gameboard,ship)
    valid_horizontal_placements = []

    rows = gameboard.number_of_rows
    columns = gameboard.number_of_columns
    length = ship.length

    gameboard.cells.each do |cell|
      coordinate_array = []
      start_cell = cell[0]
      start_cell_letter = cell[0][0]
      start_cell_number = cell[0][-1..1].to_i

      loop_start_number = start_cell_number - 1
      length.times do
        coordinate_array << "#{start_cell_letter}#{loop_start_number += 1}"
      end

      if coordinate_array.all? {|cell| gameboard.valid_coordinate?(cell)}
        valid_horizontal_placements << coordinate_array
      end
    end
    valid_horizontal_placements

  end

  def vertical_placements(gameboard,ship)
    valid_vertical_placements = []

    rows = gameboard.number_of_rows
    columns = gameboard.number_of_columns
    length = ship.length

    gameboard.cells.each do |cell|
      coordinate_array = []
      start_cell = cell[0]
      start_cell_letter = cell[0][0]
      start_cell_number = cell[0][-1..1].to_i

      loop_start_number = start_cell_letter.ord - 1

      length.times do
        coordinate_array << "#{(loop_start_number += 1).chr}#{start_cell_number}"
      end

      if coordinate_array.all? {|cell| gameboard.valid_coordinate?(cell)}
        valid_vertical_placements << coordinate_array
      end
    end
    valid_vertical_placements

  end

  def combined_valid_placements(gameboard,ship)
    horizontal_placements(gameboard,ship) + vertical_placements(gameboard,ship)
  end

end
