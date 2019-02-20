require_relative 'text_interface.rb'
require_relative 'deck.rb'
require_relative 'hand.rb'
require_relative 'player.rb'
require_relative 'user.rb'
require_relative 'dealer.rb'
require_relative 'game.rb'
require_relative 'card.rb'

menu = Game.new
menu.run
