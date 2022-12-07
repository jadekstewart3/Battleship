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

    it "can place a ship" do 
        cell = Cell.new("B4")
        ship = Ship.new("Cruiser", 3)
        cell.place_ship(ship)
        expect(cell.ship).to eq(ship)
        expect(cell.empty?).to be(false)
    end

    it "can take damage" do 
        cell = Cell.new("B4")
        ship = Ship.new("Cruiser", 3)
        cell.place_ship(ship)
        # require 'pry'; binding.pry
        expect(cell.fired_upon?).to eq(false)
        cell.fire_upon
        expect(cell.ship.health).to eq(2)
        expect(cell.fired_upon?).to eq(true)
    end

    it "can render a miss and a blank" do
        cell1 = Cell.new("B4")
        cell2 = Cell.new("C3")
        ship = Ship.new("Cruiser", 3)
        # require "pry"; binding.pry


        expect(cell1.render).to eq(".")
        cell1.fire_upon
        expect(cell1.render).to eq("M")
    end
        
    it "can render a hit" do
        cell1 = Cell.new("B4")
        cell2 = Cell.new("C3")
        ship = Ship.new("Cruiser", 3)

        cell2.place_ship(ship)
        expect(cell2.render).to eq(".")
        expect(cell2.render(true)).to eq("S")
    end
end