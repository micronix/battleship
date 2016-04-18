class Ship
    def initialize(length)
        @length = length
        @shots = []
    end
    
    def length
        @length
    end
    
    def place(x, y, across)
        if !@x.nil?
            return false
        end
        @x = x
        @y = y
        @across = across
        return true
    end
    
    def covers?(x, y)
        if @across
            @y == y && x >= @x && x < @x + @length
        else
            @x == x && y >= @y && y < @y + @length
        end
    end
    
    def overlaps_with?(ship)
        if @across
            overlaps_across(ship)
        else
            overlaps_down(ship)
        end
    end
    
    def overlaps_across(ship)
        x = @x
        while x < @x + @length
            if ship.covers?(x, @y)
                return true
            end
            x = x + 1
        end
    end
    
    def overlaps_down(ship)
        y = @y
        while y < @y + @length
            if ship.covers?(@x, y)
                return true
            end
            y = y + 1
        end
    end
    
    def fire_at(x,y)
        if covers?(x,y) && ! @shots.include?([x,y])
            @shots.push([x,y])
            return true
        else
            return false
        end
    end
    
    def sunk?
        @shots.length == @length
    end
end