require './lib/ship.rb'
require 'rspec'

RSpec.describe Ship do
  it 'exists' do
    ship = Ship.new("Cruiser", 3)

    expect(ship).to be_instance_of(Ship)
  end
end
