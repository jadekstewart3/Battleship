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

    it "can contain a ship" do
        cell = Cell.new("B4")
        ship = Ship.new("Cruiser", 3)
        expect(cell.ship).to be_nil
        expect(cell.empty?).to be(true)
    end

end