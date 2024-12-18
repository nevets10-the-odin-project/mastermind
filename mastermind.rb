require_relative('lib/game')
require_relative('lib/board')

game = Game.new
game.generate_code
puts "What's your guess?"
puts game.correct_code?(gets.chomp)
