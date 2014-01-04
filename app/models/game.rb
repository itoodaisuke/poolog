class Game < ActiveRecord::Base
  has_many :game_records
  has_many :users, through: :game_records
  accepts_nested_attributes_for :game_records

  before_save do
    if self.video_id.present?
      id = self.video_id.match(%r{http://www.youtube.com/.*[\?|&]v=([a-zA-Z0-9_-]{11})&*})
      self.video_id = id ? id[1] : nil
    end
  end
end
