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
        turn
    end  
    
    def player_fire
        player_shot = gets.chomp.to_s.upcase
        if @comp_board.valid_coordinate?(player_shot) == false
            puts "That isn't even in the ocean. Aim better.\n" 
            player_fire
        elsif @comp_board.cells[player_shot].fired_upon? == true
            puts "You've already fired there. Try to keep up, human.\n"
            player_fire
        else 
            @comp_board.cells[player_shot].fire_upon
            if @comp_board.cells[player_shot].render == "M"
                puts "Your shot on #{player_shot} has missed!! Huzzah!!\n"
            elsif @comp_board.cells[player_shot].render == "H"
                puts "You've managed to land a hit on #{player_shot}! It seems I've underestimated you....\n"
            else @comp_board.cells[player_shot].render == "X"
                puts "You've sunk my #{@comp_board.cells[player_shot].ship.name}!!!!! Damn youuuuuuuuuu!!!!!\n"
            end
        end
    end

    def comp_fire
        comp_shot = @player_board.cells.keys.sample
        if (@player_board.valid_coordinate?(comp_shot) == false)
            comp_fire
        elsif @player_board.cells[comp_shot].fired_upon? == true
            comp_fire
        else 
            @player_board.cells[comp_shot].fire_upon
            if @player_board.cells[comp_shot].render == "M"
                puts "Drat! My shot on #{comp_shot} has missed! GUNMAN! YOU BAFOON! WALK THE PLANK!\n"
            elsif @player_board.cells[comp_shot].render == "H"
                puts "I've got you now, human!"
            else @player_board.cells[comp_shot].render == "X"
                puts "HAHA! I've sunk your #{@player_board.cells[comp_shot].ship.name}! Pathetic, human!\n"
            end
        end
    end
        
    def turn 
        until (player_win? == true) || (comp_win? == true)
            puts "=============COMPUTER BOARD============="
                comp_board.render(true)
            puts "==============PLAYER BOARD=============="
                player_board.render(true)
            puts "Enter the coordinate for your shot:"
            player_fire
            comp_fire
        end
    end
    
    def player_win?
        if (@comp_cruiser.sunk? == true) && (@comp_sub.sunk? == true)
            puts "YOU WIN?!?!? NOOOOOOoooooooooooo........ *gurgle* *gurgle*\n"
            main_menu
        end
    end

    def comp_win?
        if (@player_cruiser.sunk? == true) && (@player_sub.sunk? == true)
            puts "Sleep with the fishes, human.\n"
            main_menu
        end
    end

    def main_menu
        #maybe clear board and shit
        start
    end

end