class Board

  attr_reader :cell_hash

  def initialize
    @cell_hash = {}
  end

  def cells
    @cell_hash["A1"] = Cell.new("A1")
    @cell_hash["A2"] = Cell.new("A2")
    @cell_hash["A3"] = Cell.new("A3")
    @cell_hash["A4"] = Cell.new("A4")
    @cell_hash["B1"] = Cell.new("B1")
    @cell_hash["B2"] = Cell.new("B2")
    @cell_hash["B3"] = Cell.new("B3")
    @cell_hash["B4"] = Cell.new("B4")
    @cell_hash["C1"] = Cell.new("C1")
    @cell_hash["C2"] = Cell.new("C2")
    @cell_hash["C3"] = Cell.new("C3")
    @cell_hash["C4"] = Cell.new("C4")
    @cell_hash["D1"] = Cell.new("D1")
    @cell_hash["D2"] = Cell.new("D2")
    @cell_hash["D3"] = Cell.new("D3")
    @cell_hash["D4"] = Cell.new("D4")
    @cell_hash
  end

  def valid_coordinate?(coordinate)
    @cell_hash.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinate_array)
    valid_placement_length?(ship, coordinate_array) && valid_placement_consecutive?(ship, coordinate_array) && is_diagonal?(coordinate_array) == false
    # ship.length == coordinate_array.length
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
      @cell_hash[coordinate].place_ship(ship)
    end
  end

end
