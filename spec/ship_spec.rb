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

end
