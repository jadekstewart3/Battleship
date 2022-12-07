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
        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end
end