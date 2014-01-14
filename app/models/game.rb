class Game < ActiveRecord::Base
  has_many :game_records
  has_many :users, through: :game_records
  belongs_to :party
  belongs_to :place
  accepts_nested_attributes_for :game_records
  accepts_nested_attributes_for :party

  # YoutubeのURLからVideoIDだけ抜き出して保存
  before_save do
    if self.video_id.present?
      id = self.video_id.match(%r{http://www.youtube.com/.*[\?|&]v=([a-zA-Z0-9_-]{11})&*})
      self.video_id = id ? id[1] : nil
    end
  end

  def joined_by?(user)
    return self.users.include?(user)
  end

  def winner
    return self.game_records.find_by(winner: true).try(:user)
  end

  def opponent(current_user)
    return nil unless self.joined_by?(current_user)
    return self.game_records.where.not(user_id: current_user.id).first.try(:user)
  end
end
