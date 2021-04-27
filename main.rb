require_relative './player'
require_relative './game'

#Future changes include adding ability to choose name
player_1 = Player.new('Caden')
player_2 = Player.new('John')

game = Game.new(player_1, player_2)

game.start_game