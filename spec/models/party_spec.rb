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
end
