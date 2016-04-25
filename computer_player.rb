class ComputerPlayer < Player
    def initialize
        @name = "HAL 9000"
        @grid = Grid.new
    end
    
    def place_ships(lengths)
        lengths.each do |length|
            placed = false
            while ! placed
                placed = attempt_placement(length)
            end
        end
        puts "#{@name} has placed its ships."
    end
    
    def attempt_placement(length)
        x = rand(10) + 1
        y = rand(10) + 1
        across = rand(2) == 1
        ship = Ship.new(length)
        @grid.place_ship(ship, x, y, across)
    end
end