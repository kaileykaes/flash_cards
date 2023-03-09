class Round
  attr_reader :deck,
              :turns
  
  def initialize(deck)
    @deck = deck
    @turns = []
  end  

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    deck.cards << current_card && deck.cards.shift
    turns.last
  end

  def number_correct 
    correct = 0
    turns.each do |turn|
       correct += 1 if turn.correct?
    end
    correct
  end

  def number_correct_by_category(category)
    correct = 0
    category_turns = []
    turns.each do |turn|
      category_turns << turn if turn.card.category == category
    end
    category_turns.each do |category_turn|
      correct += 1 if category_turn.correct?
    end
    correct
  end

  def percent_correct 
    (number_correct * 100).to_f / turns.count
  end

  def percent_correct_by_category(category)
    category_turns = []
    cat_correct = number_correct_by_category(category)
    turns.map do |turn|
      category_turns << turn if turn.card.category == category
    end
    (cat_correct * 100).to_f / category_turns.count
  end
end

