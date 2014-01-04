class Game < ActiveRecord::Base
  has_many :game_records
  has_many :users, through: :game_records
  accepts_nested_attributes_for :game_records
end
