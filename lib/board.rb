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
    valid_placement_length?(ship, coordinate_array) && valid_placement_consecutive?(ship, coordinate_array)
    # ship.length == coordinate_array.length
  end
  def valid_placement_length?(ship, coordinate_array)
    ship.length == coordinate_array.length
  end
  def valid_placement_consecutive?(ship, coordinate_array)
    letter_array = []
    number_array = []
    coordinate_array.each do |coordinate|
      letter_array << coordinate[0]
      number_array << coordinate[1].to_i
    end
    number_array.each_with_index do |number, index|
      if number[index + 1] == number[index] + 1
      else
        return false
      end
    end

  end

end
