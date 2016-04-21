class Grid
    def initialize
        @ships = []
        
        @letters = {}
        index = 1
        ('A'..'J').each do |y|
            @letters[y] = index
            index += 1
        end
    end
    
    def display
        str = "    1   2   3   4   5   6   7   8   9   10\n"
        str += "  -----------------------------------------\n"
        ('A'..'J').each do |y|
            row = "#{y} |"
            y = @letters[y]
            (1..10).each do |x|
                if has_ship_on?(x, y)
                    row += " O |"
                else
                    row += "   |"
                end
            end
            row += "\n"
            str += row
        end
        str +="  -----------------------------------------"
        puts str
    end
    
    def place_ship(ship, x, y, across)
        ship.place(x,y,across)
        @ships.each do |grid_ship|
            if ship.overlaps_with?(grid_ship)
                return false
            end
        end
        @ships.push(ship)
    end
    
    def has_ship_on?(x, y)
        @ships.each do |ship|
            if ship.covers?(x,y)
                return true
            end
        end
        return false
    end
end