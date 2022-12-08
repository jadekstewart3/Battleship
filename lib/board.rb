class Board
    attr_reader :cells

    def initialize
        @cells = {"A1" => Cell.new("A1"),
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
        # if ship.length == spot.length && spot.all? { |spot| valid_coordinate}
        # I have to confirm if they're giving valid coordinates!
        x = ship.length
        if x == spots.length && spots.all? { |spot| valid_coordinate?(spot) }
        #If the ship length equals the total spots listed
            letters = spots.map do |spot| #Split the spots into
                spot.split('').first.ord #letters
            end
            
            numbers = spots.map do |spot|
                spot.split('').last.to_i # And numbers
            end

            if letters.uniq.count == 1 # if all the letters are the same
                # require "pry"; binding.pry
                numbers.each_cons(x).all? {|num1, num2, num3| num1 + 1 == num2 && num2 +1 == num3}# are the numbers concecutive?
            elsif numbers.uniq.count == 1 # if all the letters are the same
                letters.each_cons(x).all? {|letter1, letter2| letter2 - letter1 == letter1 }# are the letters (converted with .ord) concecutive?
            else
                false
            end

        else
            return false
        end
    end
end