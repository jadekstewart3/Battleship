class Board
    attr_reader :cells

    def initialize
        @cells = {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D4")
        }
    end

    def valid_coordinate?(coordinate)
        @cells.keys.include?(coordinate)
    end

    def valid_length?(ship, coordinates)
        x = ship.length
        x == coordinates.length && coordinates.all? { |coordinate| valid_coordinate?(coordinate) }
    end

    def consecutive_coordinates?(spots)
        letters = spots.map do |spot| 
                spot.split('').first.ord 
            end
            
        numbers = spots.map do |spot|
            spot.split('').last.to_i 
        end

        if letters.uniq.count == 1 
            numbers.each_cons(2).all? {|num1, num2| num1 + 1 == num2}
        elsif numbers.uniq.count == 1
            letters.each_cons(2).all? {|letter1, letter2| letter1 + 1 == letter2}
        else
            false
        end
    end

    def valid_placement?(ship, spots)
        spots.sort!
        if valid_length?(ship, spots) && consecutive_coordinates?(spots)  
            true
        else
            false
        end
    end

    def place(ship, coordinates)
        if coordinates.map { |coordinate| valid_coordinate?(coordinate) && valid_placement?(ship, coordinates)}
            coordinates.map do |coordinate|
                @cells[coordinate].place_ship(ship)
            end
        end
    end

    


end