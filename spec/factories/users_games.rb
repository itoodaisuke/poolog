# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :users_game, :class => 'UsersGames' do
    user_id 1
    game_id 1
  end
end
