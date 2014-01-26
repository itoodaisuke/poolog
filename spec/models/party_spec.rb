require 'spec_helper'

describe Party do
  it "is valid with date and user_id" do
    party = build(:party)
    expect(party).to be_valid
  end

  it "is invalid without a user_id" do
    party = build(:party, user_id: nil)
    expect(party).to have(1).errors_on(:user_id)
  end

  it "is invalid without a date" do
    party = build(:party, date: nil)
    expect(party).to have(1).errors_on(:date)
  end

  describe 'rankings' do
    it "returns rankings" do
      party = create(:party)
      game = create(:game, party: party)
      rankings = [
          {wins: 1, user: game.winner},
          {wins: 0, user: game.opponent(game.winner)}
      ]
      expect(party.rankings).to match_array(rankings)
    end
  end
end
