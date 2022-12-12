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
        if status == false
            if @fired_upon == true && @ship == nil
                "M"
            elsif @fired_upon == true && @ship != nil && @ship.sunk? == false
                "H"
            elsif @fired_upon == true && @ship != nil && @ship.sunk? ==true
                "X"
            elsif @fired_upon == false
                "."
            end
        elsif status == true
            if @fired_upon == false && @ship != nil
                "S"
            elsif @fired_upon == true && @ship == nil
                "M"
            elsif @fired_upon == true && @ship != nil && @ship.sunk? == false
                "H"
            elsif @fired_upon == true && @ship != nil && @ship.sunk? == true
                "X"
            else @fired_upon == false && @ship == nil
                "."
            end
        end
    end
end