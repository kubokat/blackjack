# Game class
class Game
  attr_accessor :user, :dealer

  @@games = 0

  def run
    name = TextInterface.answer('Введите имя игрока')

    self.user = User.new(name)
    self.dealer = Dealer.new

    new_game
  end

  def new_game
    new_game_flg = 1

    if @@games > 0 && user.bank > 0 && dealer.bank > 0
      new_game_flg = TextInterface.gen_menu('start_menu')
    end

    unless new_game_flg <= 0
      @@games += 1

      user.cards, dealer.cards = nil

      user.bank -= 10
      dealer.bank -= 10

      deck = Deck.new

      user.cards = Hand.new([deck.card, deck.card])
      dealer.cards = Hand.new([deck.card, deck.card])

      show_user_cards(user)

      loop do
        if user.cards.hand.length == 3 && dealer.cards.hand.length == 3
          showdown
          break
        end

        break if user_action(deck) == false

        dealer_action(deck)
      end

      new_game
    end
  end

  def user_action(deck)
    answer = TextInterface.gen_menu('action_menu')

    case answer
    when 1 then
      true
    when 2 then
      user.cards.add_cards([deck.card])
      show_user_cards(user)
      true
    when 3 then
      showdown
      false
    end
  end

  def dealer_action(deck)
    dealer.cards.add_cards([deck.card]) if dealer.cards.score < 17
    show_user_cards(dealer, true)
  end

  def cards_list(obj, stars = false)
    result = []
    obj.cards.hand.each do |card|
      result << if !stars
                  "#{card.value} #{card.suite}"
                else
                  '*'
                end
    end

    result
  end

  def showdown
    show_user_cards(user)
    show_user_cards(dealer)

    winner = find_winner

    if winner
      find_winner.bank += 20
    else
      user.bank += 10
      dealer.bank += 10
    end

    winner_result(winner)
  end

  def winner_result(winner)
    if winner == false
      TextInterface.show_str('dead heat')
    else
      TextInterface.show_winner(winner.name, winner.bank)
    end
  end

  def show_user_cards(user, stars = false)
    if stars
      TextInterface.show_user_cards(user.name, cards_list(user, stars))
    else
      TextInterface.show_user_cards(user.name, cards_list(user, stars), user.cards.score)
    end
  end

  def find_winner
    user_score = user.cards.score
    dealer_score = dealer.cards.score

    return false if (user_score == dealer_score) || (user_score > 21 && dealer_score > 21)
    return dealer if user_score > 21 || dealer_score > user_score && dealer_score <= 21
    return user if dealer_score > 21 || dealer_score < user_score && user_score <= 21
  end
end
