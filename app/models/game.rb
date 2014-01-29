# -*- coding: utf-8 -*-
class Game < ActiveRecord::Base
  has_many :game_records
  has_many :users, through: :game_records
  belongs_to :party
  belongs_to :place
  accepts_nested_attributes_for :game_records
  accepts_nested_attributes_for :party

  validates :party, associated: true
  validates :game_records, associated: true
  validates :video_id, length: {is: 11}, if: "video_id.present?"

  # YoutubeのURLからVideoIDだけ抜き出して保存
  before_validation do
    if self.video_id.present?
      id = self.video_id.match(%r{http://www.youtube.com/.*[\?|&]v=([a-zA-Z0-9_-]{11})&*})
      self.video_id = id ? id[1] : nil
    end
  end

  def joined_by?(user)
    self.users.include?(user)
  end

  def winner
    self.game_records.find_by(winner: true).try(:user)
  end

  def opponent(current_user)
    if self.joined_by?(current_user)
      self.game_records.where.not(user_id: current_user.id).first.try(:user)
    end
  end
end
