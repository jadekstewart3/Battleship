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
        @ship.hit
        @fired_upon = true
    end
    
    def fired_upon?
        @fired_upon
    end
    
    def render(status = false)
        if status == true
            #non hidden display, either Ship, Hit, Miss, or Blank
            # blank, blank attacked, ship, ship attacked

            if @ship.sunk?
                "X"
            elsif empty?
                #blank "." or blank attacked "M"
                #perhaps add something to the fired_upon method?
                @fired_upon ? "M" : "."
            else
                # ship "S" or ship attacked "H"
                @fired_upon ? "H" : "S"
            end
        else # Hidden display, does not show S
            if empty?
                @fired_upon ? "M" : "."
            else
                @fired_upon ? "H" : "."
            end
        end
    end
end