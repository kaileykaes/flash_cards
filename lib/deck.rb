class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end  

  def add_card(card)
    cards << card
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    category_cards = []
    cards.each do |card|
      category_cards << card if card.category == category
    end
    category_cards
  end
end