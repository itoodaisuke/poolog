class Party < ActiveRecord::Base
  has_many :games
  belongs_to :user
  belongs_to :place
end
