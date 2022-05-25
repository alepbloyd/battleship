require 'pry'

class Board

  attr_reader :cells, :occupied_cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
    @occupied_cells = []
  end

  def convertible_to_integer?(string)
    string.to_i.to_s == string
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinate_array)
    valid_placement_length?(ship, coordinate_array) && valid_placement_consecutive?(ship, coordinate_array) && is_diagonal?(coordinate_array) == false && valid_placement_overlap?(ship,coordinate_array)
  end

  def valid_placement_overlap?(ship,coordinate_array)
    coordinate_array.each do |coordinate|
      if @occupied_cells.include?(coordinate)
        return false
      else
        return true
      end
    end
  end

  def valid_placement_length?(ship, coordinate_array)
    ship.length == coordinate_array.length
  end

  def valid_placement_consecutive?(ship, coordinate_array)

    actual_letter_array = []
    actual_number_array = []

    coordinate_array.each do |coordinate|
      actual_letter_array << coordinate[0]
      actual_number_array << coordinate[1].to_i
    end

    actual_start_letter = actual_letter_array[0]

    actual_start_number = actual_number_array[0]

    expected_end_letter = (actual_start_letter.ord + ship.length - 1).chr

    expected_end_number = actual_start_number + ship.length - 1

    expected_letter_array = (actual_start_letter..expected_end_letter).to_a

    expected_number_array = (actual_start_number..expected_end_number).to_a

    expected_letter_array == actual_letter_array || expected_number_array == actual_number_array
  end

  def is_diagonal?(coordinate_array)
    actual_letter_array = []
    actual_number_array = []

    coordinate_array.each do |coordinate|
      actual_letter_array << coordinate[0]
      actual_number_array << coordinate[1].to_i
    end

    if actual_letter_array.uniq.count == 1
      letter_array_consistent = true
    else
      letter_array_consistent = false
    end

    if actual_number_array.uniq.count == 1
      number_array_consistent = true
    else
      number_array_consistent = false
    end

    letter_array_consistent == false && number_array_consistent == false
  end

  def place(ship,coordinate_array)
    coordinate_array.each do |coordinate|
      @cells[coordinate].place_ship(ship)
      @occupied_cells << coordinate
    end
  end

  def number_of_rows
    cells_letter_array = []

    (@cells.keys).each do |key|
      cells_letter_array << key[0]
    end

    unique_letter_count = cells_letter_array.uniq.count
    unique_letter_count
  end

  def number_of_columns
    cells_number_array = []

    (@cells.keys).each do |key|
      cells_number_array << key[1..-1]
    end

    unique_number_count = cells_number_array.uniq.count
    unique_number_count
  end

  def render(render_status = false)
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(render_status)} #{@cells["A2"].render(render_status)} #{@cells["A3"].render(render_status)} #{@cells["A4"].render(render_status)} \n" +
    "B #{@cells["B1"].render(render_status)} #{@cells["B2"].render(render_status)} #{@cells["B3"].render(render_status)} #{@cells["B4"].render(render_status)} \n" +
    "C #{@cells["C1"].render(render_status)} #{@cells["C2"].render(render_status)} #{@cells["C3"].render(render_status)} #{@cells["C4"].render(render_status)} \n" +
    "D #{@cells["D1"].render(render_status)} #{@cells["D2"].render(render_status)} #{@cells["D3"].render(render_status)} #{@cells["D4"].render(render_status)} \n"
  end

end
