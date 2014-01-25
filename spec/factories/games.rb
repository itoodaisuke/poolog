# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    association :party
    rule "Eight-ball"

    after(:create) do |game|
      create(:win_record, game: game, user: create(:user))
      create(:game_record, game: game, user: create(:user))
    end
  end
end
