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

    def valid_placement?(ship, spots)
        x = ship.length
        #first confirm that the number of spots == length of the ship
        #then confirm that each spot given is a valid_coorinate
        #we must itterate through each spot, and we want it to return false
        #if it's not on the board.
        
        if x == spots.length && spots.all? { |spot| valid_coordinate?(spot) }
            letters = spots.map do |spot| #Split the spots into
                spot.split('').first.ord #letters
            end
            
            numbers = spots.map do |spot|
                spot.split('').last.to_i # And numbers
            end

            if letters.uniq.count == 1 # if all the letters are the same
                numbers.each_cons(2).all? {|num1, num2| num1 + 1 == num2}# are the numbers concecutive?
            elsif numbers.uniq.count == 1 # if all the letters are the same
                letters.each_cons(2).all? {|letter1, letter2| letter1 + 1 == letter2}# are the letters (converted with .ord) concecutive?
                # JADE - I never modified line 47 to match the logic of line 45. Now that I have, it runs with a passing test :)
            else
                false
            end
        else
            return false
        end
    end

    def place_ship
        
    end
end