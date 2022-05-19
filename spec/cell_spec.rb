require './lib/ship'
require './lib/cell'
require 'rspec'

RSpec.describe Cell do

  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it "returns coordinate" do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it "returns nil, if no ship" do
    cell = Cell.new("B4")

    expect(cell.ship).to be_nil
  end

  it "returns true when empty" do
    cell = Cell.new("B4")

    expect(cell.empty?).to be true
  end

  it "places a ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
  end


  it "defaults to false before fired upon" do

    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq false

  end

  it "can be fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq 2
  end

  it "returns true when fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon
    expect(cell.fired_upon?).to eq true

  end

  it "renders as '.' if not fired upon" do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
  end

  it "renders as 'M' when fired upon with no ship" do
    cell_1 = Cell.new("B4")

    cell_1.fire_upon

    expect(cell_1.render).to eq("M")

  end

  it "returns 'S' when render set to true" do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    expect(cell_2.render(true)).to eq("S")

  end

  it "returns 'H' when fired upon with a ship" do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cell_2.render).to eq ("H")
  end

  it "sunk returns true when health is 0" do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq true
  end



end
