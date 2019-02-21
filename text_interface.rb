# Interface
module TextInterface
  @@start_menu = ['Start new game', ' 0. No', ' 1. Yes']
  @@action_menu = ['Change action', '1. skip', '2. add cart', '3. showdown']

  def self.gen_menu(var_name)
    puts class_variable_get("@@#{var_name}")
    gets.to_i
  end

  def self.answer(answer)
    puts answer
    gets.chomp
  end

  def self.show_str(*_args)
    puts _args
  end

  def self.show_user_cards(_user, cards, _score = nil)
    result = "#{_user}: #{cards.join(' ')}"

    result += " = #{_score}" unless _score.nil?

    puts result
  end

  def self.show_winner(name, bank)
    puts "#{name} is winner #{bank}$"
  end
end
