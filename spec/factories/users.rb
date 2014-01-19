FactoryGirl.define do
  factory :user do
    sequence(:name) {|i| "hoge#{i}"}
    sequence(:email) {|i| "test#{i}@example.com"}
    password "hogehoge"
    password_confirmation "hogehoge"
    provider "facebook"
    sequence(:uid) {|i| "123456#{i}"}
  end
end
