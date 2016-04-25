class HumanPlayer < Player
    def initialize(name="Dave")
        @name = name
        @grid = Grid.new
    end
    
    def place_ships(lengths)
        lengths.each do |length|
            placed = false
            while ! placed
                placed = attempt_placement(length)
                if ! placed
                    puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
                end
            end
        end
    end
    
    def attempt_placement(length)
        puts "#{@name}, where would you like to place a ship of length #{length}?"
        position = get_user_input.chomp
        puts "Across or Down?"
        across = get_user_input.chomp
        x = @grid.x_of(position)
        y = @grid.y_of(position)
        across = across == "Across"
        ship = Ship.new(length)
        @grid.place_ship(ship, x, y, across)
    end
end