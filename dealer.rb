# Dealer class
class Dealer < Player
  attr_accessor :name

  def initialize
    super
    @name = 'Dealer'
  end
end
