# Menu class
class Menu
  attr_accessor :user, :dealer

  @@games = 0
  @@start_menu = ['Start new game', ' 0. No', ' 1. Yes']
  @@action_menu = ['Change action', '1. skip', '2. add cart', '3. showdown']

  def run
    puts 'Введите имя игрока'
    name = gets.chomp

    self.user = User.new(name)
    self.dealer = Dealer.new

    new_game
  end

  def new_game
    new_game_flg = 1

    if @@games > 0
      puts @@start_menu
      new_game_flg = gets.to_i
    end

    if new_game_flg > 0
      @@games += 1

      puts "Game number #{@@games} #{user.bank}$"

      user.cards = []
      dealer.cards = []

      user.bank = user.bank - 10
      dealer.bank = dealer.bank - 10

      Deck.make_deck
      user.add_cards([Deck.card, Deck.card])
      dealer.add_cards([Deck.card, Deck.card])
      puts show_cards(user)

      loop do
        if user.cards.length == 3 && dealer.cards.length == 3
          showdown
          break
        end

        break if user_action == false

        dealer_action
      end

      new_game
    end
  end

  def user_action
    puts @@action_menu

    answer = gets.to_i

    case answer
    when 1 then
      true
    when 2 then
      user.add_cards([Deck.card])
      puts show_cards(user)
      true
    when 3 then
      showdown
      false
    end
  end

  def dealer_action
    dealer.add_cards([Deck.card]) if dealer.score < 17
    puts show_cards(dealer, true)
  end

  def showdown
    puts "#{show_cards(user)} / #{show_cards(dealer)}"

    if find_winner
      find_winner.bank += 10
      puts "#{find_winner.name} is winner #{find_winner.bank}$"
    else
      user.bank += 10
      dealer.bank += 10
      puts 'dead heat'
    end
  end

  def show_cards(obj, stars = false)
    result = "#{obj.name}:"
    obj.cards.each do |card|
      card.each do |key, _value|
        result += !stars ? " #{key} " : ' *'
      end
    end

    result += " = #{obj.score}" unless stars

    result
  end

  def find_winner
    user_score = user.score
    dealer_score = dealer.score

    return false if (user_score == dealer_score) || (user_score > 21 && dealer_score > 21)
    return dealer if user_score > 21 || dealer_score > user_score && dealer_score < 21
    return user if dealer_score > 21 || dealer_score < user_score && user_score < 21
  end
end
