require 'spec_helper'

describe GameRecord do
  it "is valid with proper attributes" do
    game_record = build(:game_record)
    expect(game_record).to be_valid
  end

  it "is invalid without a user_id" do
    game_record = build(:game_record, user_id: nil)
    expect(game_record).to have(1).errors_on(:user_id)
  end

  it "is invalid without a game_id" do
    game_record = build(:game_record, game_id: nil)
    expect(game_record).to have(1).errors_on(:game_id)
  end
end
