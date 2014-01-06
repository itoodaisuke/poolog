class Party < ActiveRecord::Base
  has_many :games
  belongs_to :user
  belongs_to :place, foreign_key: :foursquare_id

  def set_place(foursquare_id)
    # p place = Place.where(foursquare_id: foursquare_id)
    p place = Place.create(name: 'hoge', foursquare_id: foursquare_id)
  end
end
