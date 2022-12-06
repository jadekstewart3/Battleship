require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do 
    it "it exists" do 
        cell = Cell.new("B4")
        expect(cell).to be_an_instance_of(Cell)
    end
end