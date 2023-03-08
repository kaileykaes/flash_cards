require 'spec_helper'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Juneau", @card)
    @turn2 = turn = Turn.new("Saturn", @card2)
  end

  it 'exists' do
    expect(@turn).to be_a(Turn)
  end

  it 'has attributes' do 
    expect(@turn.card).to eq(@card)
    expect(@turn.guess).to eq("Juneau")
  end

  it 'knows if guess is correct' do 
    expect(@turn.correct?).to eq(true)
    expect(@turn2.correct?).to eq(false)
  end

  it 'gives feedback' do 
    expect(@turn.feedback).to eq("Correct!")
    expect(@turn2.feedback).to eq("False.")
  end
end