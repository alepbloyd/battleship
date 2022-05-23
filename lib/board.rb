require 'pry'

class Board

  attr_reader :cells, :occupied_cells, :rows_array, :columns_array, :cells_array

  def initialize
    @cells = {}
    @number_of_rows = 0
    @rows_array = []
    @columns_array = []
    @cells_array = []
    @number_of_columns = 0
    @occupied_cells = []
  end

  def get_board_size
    puts "Please enter number of rows you would like to play with."

    rows_input = gets.chomp

    while convertible_to_integer?(rows_input) == false do
      puts "Invalid input! Please enter a positive integer!"
      rows_input = gets.chomp
    end

    puts "Please enter number of columns you would like to play with."

    columns_input = gets.chomp

    while convertible_to_integer?(columns_input) == false do
      puts "Invalid input! Please enter a positive integer!"
      columns_input = gets.chomp
    end

    @number_of_rows = rows_input.to_i
    @number_of_columns = columns_input.to_i

    @columns_array = (1..@number_of_columns).to_a
    @rows_array = ("A"..(65 + @number_of_rows - 1).chr).to_a

    @rows_array.each do |letter|
      @columns_array.each do |number|
        @cells_array << "#{letter}#{number}"
      end
    end

    @cells_array.each do |cell|
      @cells[cell] = Cell.new(cell)
    end

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
    row_chunks = @cells_array.each_slice(@number_of_columns).to_a

    start_render_line = "  "
    middle_render_lines = ""

    @columns_array.each do |number|
      start_render_line += "#{number} "
    end

    @rows_array.count.times do |row|
      new_line = "#{(65+row).chr} "

      render_line = row_chunks[row].map{ |element| @cells[element].render(render_status)}

      middle_render_lines += (new_line + render_line.join(' ') + " \n")
    end

    start_render_line + " \n" + middle_render_lines
  end

end
