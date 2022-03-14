require_relative 'lib/game'



new_game = Game.new

new_game.move

loop do
    puts "Do you want a rematch? (y/n)"
    a = gets.chomp.downcase
    if a != "y"
        break
    else
        new_game.rematch
    end
end