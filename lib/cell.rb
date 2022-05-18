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

  def render(render_status = false)
    if render_status == true
      if @placed_ship == nil && @fired_upon
        return "M"
      elsif @placed_ship == nil && @fired_upon == false
        return "."
      elsif @placed_ship != nil && @fired_upon
        return "H"
      elsif @placed_ship != nil && @fired_upon == false
        return "S"
      end
    else
      if @placed_ship == nil && @fired_upon
        return "M"
      elsif @placed_ship == nil && @fired_upon == false
        return "."
      elsif @placed_ship != nil && @fired_upon
        return "H"
      elsif @placed_ship != nil && @fired_upon == false
        return "."
      end
    end
  end

end
