class Game < ActiveRecord::Base
  has_many :game_records
  has_many :users, through: :game_records
end
