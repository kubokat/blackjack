# Dealer class
class Dealer < Player
  attr_reader :name

  def initialize
    super
    @name = 'Dealer'
  end
end
