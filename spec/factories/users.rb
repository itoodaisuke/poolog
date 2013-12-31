FactoryGirl.define do
  factory :user do
    email    "test@example.com"
    password "hogehoge"
    password_confirmation "hogehoge"
  end
end
