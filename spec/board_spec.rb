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


    it "verifies valid length of ship to coordinates" do
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(@board.valid_length?(submarine, ["A1", "A2"])).to be(true)
        expect(@board.valid_length?(submarine, ["A1", "A2", "A3"])).to be(false)
    end

    it "ship coordinates are consecutive" do
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(@board.consecutive_coordinates?(["A1", "A2"])).to be(true)
        expect(@board.consecutive_coordinates?(["A1", "B2", "C3"])).to be(false)
        expect(@board.consecutive_coordinates?(["A1", "A2", "A4"])).to be(false)
        expect(@board.consecutive_coordinates?(["A1", "C1"])).to be(false)
        expect(@board.consecutive_coordinates?(["A3", "A2", "A1"])).to be(false)
        expect(@board.consecutive_coordinates?(["C1", "B1"])).to be(false)
    end     

    it "accepts valid coordinates" do
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to be(true)
        expect(@board.valid_placement?(submarine, ["A2", "A3"])).to be(true)
        expect(@board.valid_placement?(submarine, ["A2", "A4"])).to be(false)
        expect(@board.valid_placement?(cruiser, ["E1", "E2", "E3"])).to eq(false)
    end

    it "can place ships" do 
        cruiser = Ship.new("Cruiser", 3)
        @board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = @board.cells["A1"]
        cell_2 = @board.cells["A2"]
        cell_3 = @board.cells["A3"]

        expect(cell_1.ship).to eq(cruiser)
        expect(cell_2.ship).to eq(cruiser)
        expect(cell_3.ship).to eq(cruiser)
        expect(cell_3.ship == cell_2.ship).to be(true)
    end

    it "can not have overlapping ships" do
        cruiser = Ship.new("Cruiser", 3)
        @board.place(cruiser, ["A1", "A2", "A3"])
        submarine = Ship.new("Submarine", 2)

        expect(@board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end

    it "renders a board" do
        cruiser = Ship.new("Cruiser", 3)
        @board.place(cruiser, ["A1", "A2", "A3"])
        
        expect(@board.render).to eq("  1 2 3 4 \n" + "A . . . . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n")
        expect(@board.render(true)).to eq("  1 2 3 4 \n" + "A S S S . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n")
   end

    it "will render a sunk ship" do
        cruiser = Ship.new("Cruiser", 3)
        @board.place(cruiser, ["A1", "A2", "A3"])

        cell_1 = @board.cells["A1"]
        cell_2 = @board.cells["A2"]
        cell_3 = @board.cells["A3"]

        cell_1.fire_upon
        cell_2.fire_upon
        cell_3.fire_upon

        expect(@board.render(true)).to eq("  1 2 3 4 \n" + "A X X X . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n")
        expect(@board.render).to eq("  1 2 3 4 \n" + "A X X X . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n")
    end

    it "will render a miss" do
        cell_1 = @board.cells["A1"]
        cell_2 = @board.cells["A2"]
        cell_3 = @board.cells["A3"]

        cell_1.fire_upon
        cell_2.fire_upon
        cell_3.fire_upon

        expect(@board.render(true)).to eq("  1 2 3 4 \n" + "A M M M . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n")
        expect(@board.render).to eq("  1 2 3 4 \n" + "A M M M . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n")
    end
end