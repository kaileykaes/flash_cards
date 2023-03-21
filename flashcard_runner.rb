require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
category1 = :STEM
category2 = :Geography
deck = Deck.new
deck.add_card(card_1)
deck.add_card(card_2)
deck.add_card(card_3)
round = Round.new(deck)


puts "Welcome! You're playing with #{deck.cards.count} cards."
puts "This is card number #{round.turns.count + 1} out of #{deck.cards.count}"
(deck.cards.count).times do puts "Question: #{round.current_card.question}"
round.take_turn(gets.chomp.to_s)
turn = round.turns.last
puts turn.feedback
end
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct.round(1)}%"
puts "#{category1} –– #{round.number_correct_by_category(category1)} correct or #{round.percent_correct_by_category(category1)}%"
puts "#{category2} –– #{round.number_correct_by_category(category2)} correct or #{round.percent_correct_by_category(category2)}%"
puts "Congratulations, my friend!"

