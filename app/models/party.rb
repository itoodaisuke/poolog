class Party < ActiveRecord::Base
  has_many :games
  belongs_to :user
  belongs_to :place, foreign_key: :foursquare_id

  def rankings
    rankings = []
    win_records = self.games.map{|g| g.winner}
    win_records.compact.each do |w|
      rankings << { user: w, wins: win_records.count(w) }
    end
    rankings.sort! {|a,b| a.wins <=> b.wins }
  end
end
