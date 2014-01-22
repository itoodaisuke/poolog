class GameRecord < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :user_id, presence: true

  # user_idにuidが入ってるので、本来のid(user_id)に変換して保存
  before_save do
    user = User.find_by(uid: self.user_id)
    self.user_id = user.id
  end
end
