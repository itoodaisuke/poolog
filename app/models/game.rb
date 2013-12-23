class Game < ActiveRecord::Base
  has_many :game_members
  has_many :users, through: :game_members
  has_many :matches
  validates :name, :presence => true
end
