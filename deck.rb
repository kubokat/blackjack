# Deck module
module Deck
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  MARKED_CARDS = %w[A J Q K].freeze

  attr_reader :kol

  @kol = []

  def self.make_deck
    i = 0

    SUITS.each do |suit|
      (2..9).each do |j|
        @kol[i] = Hash[j.to_s + suit, j]
        i += 1
      end

      MARKED_CARDS.each do |mark|
        @kol[i] = Hash[mark + suit, mark]
        i += 1
      end
    end

    @kol
  end

  def self.card
    @kol.delete(@kol.sample)
  end
end
