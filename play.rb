require './battleship'

def get_user_input
    gets
end

=begin
print "Enter your name: "
name = gets.chomp
player = HumanPlayer.new(name)

player.place_ships([2,5])
player.grid.display
=end

player = ComputerPlayer.new
player.place_ships([2,3,3,5])
player.grid.display


