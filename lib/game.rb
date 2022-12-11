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
            comp_place_cruiser
            comp_place_sub
        else
           p "Byeeeee"
        end
    end

    def comp_place_cruiser
        array_coordinates = @comp_board.cells.keys.sample(3)
        if    @comp_board.valid_placement?(@comp_cruiser.name, array_coordinates) == true
            comp_place_cruiser
        elsif @comp_board.valid_placement?(@comp_cruiser.name, array_coordinates) == true
            @comp_board.place(@comp_cruiser.name, array_array_coordinates)
        end
        comp_place_sub
    end  

    def comp_place_sub
        array_array_coordinates = @comp_board.cells.keys.sample(2)
        if @comp_board.valid_placement?(@comp_sub.name, array_coordinates) == false
            comp_place_sub
        elsif @comp_board.valid_placement?(@comp_sub.name, array_coordinates) == true
            @comp_board.place(@comp_sub.name, array_array_coordinates)
        end
        run_game
    end

    def run_game
      p "I have laid out my ships on the grid."
      p "You now need to lay out your two ships."
      p  "The Cruiser is three units long and the Submarine is two units long."
      p  "1 2 3 4"
      p  "A . . . ."
      p  "B . . . ."
      p  "C . . . ."
      p  "D . . . ."
      p  "Enter the squares for the Cruiser (3 spaces): "
      p   ">"

    end
end