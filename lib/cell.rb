class Cell

  attr_reader :coordinate, :empty

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @placed_ship = nil
  end

  def ship
    @placed_ship
  end

  def empty?
    @empty
  end

  def place_ship(ship_type)
    @placed_ship = ship_type
    @empty = false
  end

end
