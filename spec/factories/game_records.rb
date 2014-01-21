# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_record do
    association :user
    association :game

    factory :win_record do
      winner true
    end
  end
end
