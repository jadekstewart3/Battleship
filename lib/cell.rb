class Cell
    attr_reader :coordinate, :ship, :fired_upon

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = ship
        @fired_upon = false
    end

    def empty?
        !@ship 
    end

    def place_ship(ship)
       @ship = ship
    end

    def fire_upon
        @fired_upon = true
        if ship
            ship.hit
        end
    end
    
    def fired_upon?
        @fired_upon
    end
    
    def render(status = false)
        if status == true
            #non hidden display, either Ship, Hit, Miss, or Blank
            # blank, blank attacked, ship, ship attacked

            if empty?
                #blank "." or blank attacked "M"
                #perhaps add something to the fired_upon method?
                @fired_upon ? "M" : "."
            else
                # ship "S" or ship attacked "H"
                @fired_upon ? "H" : "S"
                @ship.sunk? ? "X" : "S"
            end
        else # Hidden display, does not show S
            if empty?
                @fired_upon ? "M" : "."
            else
                @fired_upon ? "H" : "."
                @ship.sunk? ? "X" : "."
            end
        end
    end
end