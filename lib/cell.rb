class Cell

  attr_reader :coordinate, :empty

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
  end

  def ship
  end

  def empty?
    @empty
  end

end
