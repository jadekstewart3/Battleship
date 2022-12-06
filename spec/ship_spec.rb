require 'rspec'
require './lib/ship'

RSpec.describe Ship do 
    it "it exists" do 

        ship = Ship.new("Cruiser", 3)
        expect(ship).to be_an_instance_of(Ship)
    end

    it "has health" do
        ship = Ship.new("Cruiser", 3)
        expect(ship.health).to eq(3)
    end
    
    it "has not sunk by default" do 

        ship = Ship.new("Cruiser", 3)
        expect(ship.sunk?).to eq(false)
    end
end