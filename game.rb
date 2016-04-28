class Game
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @attacker = @player1
        @defender = @player2
    end
    
    def welcome
        puts "Welcome, #{@player1.name} and #{@player2.name}!"
        puts "It's time to play Battleship."
    end
    
    def place_ships
        @player1.place_ships([2,3,3,4,5])
        @player2.place_ships([2,3,3,4,5])
    end
    
    def display_status
        puts "SHOTS TAKEN:"
        @player2.grid.display_shots
        puts ""
        puts "YOUR BOARD:"
        @player1.grid.display
    end
    
    def take_turn
        shot = @attacker.call_shot
        x = @defender.grid.x_of(shot)
        y = @defender.grid.y_of(shot)
        
        if @defender.grid.fire_at(x, y)
            puts "Hit!"
        else
            puts "Miss!"
        end
        
        # some code
        if @attacker == @player1
            @attacker = @player2
            @defender = @player1
        else
            @attacker = @player1
            @defender = @player2
        end
    end
    
    def play
        place_ships
        
        while ! @player1.grid.sunk? && ! @player2.grid.sunk? do
            take_turn
            display_status
        end
        
        if @player1.grid.sunk?
            puts "Congratulations, #{@player2.name}!"
        else
            puts "Congratulations, #{@player1.name}!"
        end
    end
end