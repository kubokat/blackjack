# Player class
class Player
  attr_accessor :bank, :cards, :name

  def initialize(*_args)
    @bank = 100
  end
end
