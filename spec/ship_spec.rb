require 'rspec'
require './lib/ship'

RSpec.describe Ship do 
    it "it exists" do 

        ship = Ship.new("Cruiser", 3)
        expect(ship).to be_an_instance_of(Ship)
    end
end