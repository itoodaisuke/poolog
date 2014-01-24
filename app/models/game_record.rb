class GameRecord < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :user_id, presence: true
end
