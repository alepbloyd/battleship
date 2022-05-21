require './lib/ship'
require './lib/cell'
require './lib/board'
require 'rspec'
require 'pry'



RSpec.describe ComputerPlacement do

  it 'exists' do
    computer_placement = ComputerPlacement.new

    expect(computer_placement).to be_instance_of(ComputerPlacement)
  end

end
