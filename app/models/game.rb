class Game < ActiveRecord::Base
  has_many :game_members
  has_many :users, through: :game_members
  has_many :matches
  belongs_to :place
  validates :name, :presence => true
end
