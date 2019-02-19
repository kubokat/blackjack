# User class
class User < Player
  attr_accessor :name

  def initialize(name)
    super
    @name = name
  end
end
