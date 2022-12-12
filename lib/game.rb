require './lib/ship'
require './lib/cell'
require './lib/board'
class Game
    attr_reader :player_board,
                :comp_board,
                :player_cruiser,
                :player_sub,
                :comp_sub,
                :comp_cruiser
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
            place_comp_ships
            run_game
        else
           p "Byeeeee"
        end
    end


    def valid_comp_coordinates(ship)
        coordinates = []
        until @comp_board.valid_placement?(ship, coordinates)
            coordinates = @comp_board.cells.keys.sample(ship.length) 
        end
        coordinates
    end

    def place_comp_ships
        ships = [@comp_cruiser, @comp_sub]
        ships.each do |ship|
            coordinates = valid_comp_coordinates(ship)
            @comp_board.place(ship, coordinates)
        end
    end

    def player_input_cruiser
        input = gets.chomp.to_s.upcase.split
        placement = @player_board.valid_placement?(player_cruiser, input)
        
        if placement == true
            @player_board.place(player_cruiser, input)
        else
            p "-------Invalid Coordinates - Please Try Again---------"
            player_input_cruiser
        end
    end

    def player_input_sub
        input = gets.chomp.to_s.upcase.split
        placement = @player_board.valid_placement?(player_sub, input)
        
        if placement == true
            @player_board.place(player_sub, input)
        else
            p "-------Invalid Coordinates - Please Try Again---------"
            player_input_sub
        end
    end    

    def run_game
        puts "\nI have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts  "The Cruiser is three units long and the Submarine is two units long.\n"
        puts  "  1 2 3 4"
        puts  "A . . . ."
        puts  "B . . . ."
        puts  "C . . . ."
        puts  "D . . . ."
        puts  "Enter the squares for the Cruiser (3 spaces): "
        puts   ">"

        player_input_cruiser

        puts "Enter the squares for the Submarine (2 spaces):\n>"

        player_input_sub

        puts "=============COMPUTER BOARD============="
        comp_board.render(true) #remember to make this not true
        puts "==============PLAYER BOARD=============="
        player_board.render(true)

        puts "Enter the coordinate for your shot:"
        
        
        
        puts "Enter the coordinate for your shot: \n>"
        player_shot = gets.chomp.to_s.upcase
        
        valid_attack = comp_board.cells.keys.include?(player_shot) && (comp_board.cells[player_shot].fired_upon == false)
        require "pry"; binding.pry
        # if player_shot == valid_attack
        # comp_board.cells["A1"].fire_upon
        # player_board.cells.keys.sample[#call random not fired on cell].fire_upon
        




        

        # game_over = player_cruiser.sunk? && player_sub.sunk? #stop condition for the loop
        # until game_over
            # puts "=============COMPUTER BOARD============="
            # comp_board.render
            # puts "==============PLAYER BOARD=============="
            # player_board.render

        # Player choosing a coordinate to fire on
        # Computer choosing a coordinate to fire on
        # Reporting the result of the Player’s shot
        # Reporting the result of the Computer’s shot
        


    end
end