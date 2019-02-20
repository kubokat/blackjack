# Card class
class Card
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  MARKED_CARDS = %w[A J Q K].freeze

  attr_accessor :suite, :value, :score

  def initialize(suite, value, score)
    @suite = suite
    @value = value
    @score = score
  end
end
