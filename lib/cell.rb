class Cell

  attr_reader :coordinate, :empty

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @placed_ship = nil
    @fired_upon = false
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

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @placed_ship == nil
      return
    else
      @placed_ship.hit
    end
  end

  def render
    if @fired_upon && @placed_ship == nil
      return "M"
    else
      return "."
    end
  end

end
