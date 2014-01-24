# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    foursquare_id "123456"
    name "MyString"
  end
end
