require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do 
    it "exists" do 
        cell = Cell.new("B4")
        expect(cell).to be_an_instance_of(Cell)
    end

    it "has a coordinate" do 
        cell = Cell.new("B4")
        expect(cell.coordinate).to eq("B4")
    end

end