class Party < ActiveRecord::Base
  has_many :games
  belongs_to :user
  belongs_to :place, foreign_key: :foursquare_id

  validates :user_id, presence: true
  validates :date, presence: true


  def members
    self.games.map{|g| g.users}.flatten.uniq
  end

  def rankings
    rankings = []
    win_records = self.games.map{|g| g.winner}
    self.games.map{|g| g.users}.flatten.uniq.each do |w|
      rankings << { user: w, wins: win_records.count(w) }
    end
    rankings.sort_by{|e| -e[:wins]}
  end
end
