require './lib/ship.rb'
require 'rspec'

RSpec.describe Ship do
  it 'exists' do
    ship = Ship.new("Cruiser", 3)

    expect(ship).to be_instance_of(Ship)
  end

  it 'returns name' do
    ship = Ship.new("Cruiser", 3)

    expect(ship.name).to eq("Cruiser")
  end

  it 'returns length' do
    ship = Ship.new("Cruiser", 3)

    expect(ship.length).to eq(3)
  end

  it 'returns health' do
    ship = Ship.new("Cruiser", 3)

    expect(ship.health).to eq(3)
  end

  it 'initialize sunk as false' do
    ship = Ship.new("Cruiser", 3)

    expect(ship.sunk?).to eq false
  end

  it 'can be hit' do
    ship = Ship.new("Cruiser", 3)

    ship.hit
    expect(ship.health).to eq(2)
  end

  it 'can be hit more than once' do
    ship = Ship.new("Cruiser", 3)
    ship.hit
    ship.hit
    expect(ship.health).to eq(1)
  end

end
