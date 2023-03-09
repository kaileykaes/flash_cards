require 'spec_helper'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new
    @deck.add_card(@card_1)
    @deck.add_card(@card_2)
    @deck.add_card(@card_3)
    @round = Round.new(@deck)
  end

  it 'exists and has attributes' do
    expect(@round).to be_a(Round)
    expect(@round.turns).to eq([])
    expect(@round.deck).to be_a(Deck)
  end
  
  it '#current_card' do
  expect(@round.current_card).to eq(@deck.cards[0])
  end

  it 'takes turns' do 
    @new_turn = @round.take_turn("Juneau")
    expect(@new_turn).to be_a(Turn)
    expect(@new_turn.correct?).to be true
    expect(@round.turns).to eq([@new_turn])
    expect(@new_turn.correct?).to be true
    expect(@round.current_card).to eq(@card_2)
  end

  it 'knows how many turns are correct' do
    @new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
  end
end