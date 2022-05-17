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


end
