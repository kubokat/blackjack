# class Hand
class Hand
  attr_accessor :hand, :score

  def initialize(cards_list)
    @hand = []
    @score = 0

    add_cards(cards_list)
  end

  def add_cards(cards_list)
    cards_list.each do |card|
      @hand << card
      scores(card)
    end
  end

  def scores(card)
    self.score += if card.value == 'A'
                    if 21 - self.score >= 11
                      11
                    elsif 21 - self.score > 0
                      21 - self.score
                    else
                      1
                    end
                  else
                    card.score
                  end
  end
end
