require './battleship'

def get_user_input
    gets
end

player1 = HumanPlayer.new("Ramiro")
player2 = ComputerPlayer.new
game = Game.new(player1, player2)
game.play


