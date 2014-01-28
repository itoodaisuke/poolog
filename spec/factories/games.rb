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

  factory :game_with_no_winner, class: Game do
    association :party
    rule "Eight-ball"

    after(:create) do |game|
      create(:game_record, game: game, user: create(:user))
      create(:game_record, game: game, user: create(:user))
    end
  end

  factory :game_with_two_winners, class: Game do
    association :party
    rule "Eight-ball"

    after(:create) do |game|
      create(:win_record, game: game, user: create(:user))
      create(:win_record, game: game, user: create(:user))
    end
  end
end
