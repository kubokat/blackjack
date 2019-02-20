# Deck class
class Deck
  attr_reader :cards

  @cards = []

  def initialize
    @cards = make_deck
  end

  def make_deck
    deck = []

    Card::SUITS.each do |suit|
      (2..9).each do |j|
        deck << Card.new(suit, j, j)
      end

      Card::MARKED_CARDS.each do |mark|
        deck << Card.new(suit, mark, 10)
      end

      deck << Card.new(suit, 'A', nil)
    end

    deck
  end

  def card
    @cards.delete(@cards.sample)
  end
end
