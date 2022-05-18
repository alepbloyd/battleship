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


end
