# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :party do
    date Date.today.strftime("%Y-%m-%d")
    association :user
  end
end
