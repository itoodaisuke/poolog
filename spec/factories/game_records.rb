# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_record do
    association :game
    association :user

    factory :win_record do
      winner true
    end
  end
end
