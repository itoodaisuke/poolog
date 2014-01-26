require 'spec_helper'

describe User do
  describe 'find_or_create' do
    it "returns the user if it exists" do
      user = create(:user)
      user_param = {
        user_id: user.uid,
        user_name: user.name,
      }
      expect(User.find_or_create(user_param)).to eq user
    end

    it "returns a new user if it not exist" do
      user_param = {
        user_id: Faker::Number.number(10),
        user_name: 'hogehoge',
      }
      expect(User.find_or_create(user_param).name).to eq 'hogehoge'
    end
  end
end
