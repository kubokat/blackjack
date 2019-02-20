# Interface
module TextInterface
  @@start_menu = ['Start new game', ' 0. No', ' 1. Yes']
  @@action_menu = ['Change action', '1. skip', '2. add cart', '3. showdown']

  def self.gen_menu(var_name)
    puts class_variable_get("@@#{var_name}")
    gets.to_i
  end

  def self.show_cards(obj, stars = false)
    result = "#{obj.name}:"
    obj.cards.hand.each do |card|
      result += !stars ? " #{card.value} #{card.suite} " : ' *'
    end

    result += " = #{obj.cards.score}" unless stars

    puts result
  end

  def self.answer(answer)
    puts answer
    gets.chomp
  end

  def self.winner_result(winner)
    if winner == false
      puts 'dead heat'
    else
      puts "#{winner.name} is winner #{winner.bank}$"
    end
  end
end
