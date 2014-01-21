# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :party do
    association :user
    date Date.today
  end
end
