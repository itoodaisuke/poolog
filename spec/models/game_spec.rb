require 'spec_helper'

describe Game do
  it "is valid with a party association" do
    game = build(:game)
    expect(game).to be_valid
  end

  it "is invalid without a party association" do
    game = build(:game, party_id: nil)
    expect(game).to have(1).errors_on(:party_id)
  end
end
