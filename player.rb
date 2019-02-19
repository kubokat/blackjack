# Player class
class Player
  attr_accessor :bank, :cards

  def initialize(*_args)
    @bank = 100
    @cards = []
  end

  def add_cards(cards_list)
    cards_list.each do |card|
      @cards << card
    end
  end

  def score
    sum = 0
    @cards.each do |card|
      card.each do |_key, value|
        sum += if %w[J Q K].include? value
                 10
               elsif value == 'A'
                 if 21 - sum > 11
                   11
                 elsif 21 - sum > 0
                   21 - sum
                 else
                   1
                 end
               else
                 value
               end
      end
    end
    sum
  end
end
