# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    association :party
    rule "Eight-ball"

    after(:create) do |game|
      2.times do
        create(:game_record, game: game, user: create(:user))
      end
    end
  end
end
