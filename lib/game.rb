require './lib/ship'
require './lib/cell'
require './lib/board'
class Game
    attr_reader :player_board,
                :comp_board
    def initialize
        @player_board = Board.new
        @comp_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_sub = Ship.new("Submarine", 2)
        @comp_cruiser = Ship.new("Cruiser", 3)
        @comp_sub = Ship.new("Submarine", 2)
    end

    def start 
        p "Welcome to BATTLESHIP"
        p "Enter p to play. Enter q to quit."
        user_input = gets.chomp.downcase
        if user_input == "p"
            run_game
        else
           p "Boi byeeee"
        end
    end

    def run_game
        
    end
end