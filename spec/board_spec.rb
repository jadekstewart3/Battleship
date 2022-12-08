require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do 
    before do
        @board = Board.new
    end

    it "exists" do 
        expect(@board).to be_an_instance_of(Board)
    end

    it "has cells" do 
        expect(@board.cells).to be_a(Hash)
        expect(@board.cells.length).to eq(16)
    end

    it "confirms valid coordinates" do
        expect(@board.valid_coordinate?("A1")).to eq(true)
        expect(@board.valid_coordinate?("D4")).to eq(true)
        expect(@board.valid_coordinate?("A5")).to eq(false)
        expect(@board.valid_coordinate?("E1")).to eq(false)
        expect(@board.valid_coordinate?("A22")).to eq(false)
    end

    it "coordinates are same length as ship" do 
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
        expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
    end

    it "ship coordinates are concecutive" do
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        
        require "pry"; binding.pry
        expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be(false)
        expect(@board.valid_placement?(submarine, ["A1", "C1"])).to be(false)
        
        expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be(false)
        expect(@board.valid_placement?(submarine, ["C1", "B1"])).to be(false)
    end        

end