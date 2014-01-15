class GameRecord < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  # user_idにuidが入ってるので、本来のid(user_id)に変換
  before_save do
    user = User.find_by(uid: self.user_id)
    self.user_id = user.id
  end

  scope :win, -> { where(winner: true) }
end
