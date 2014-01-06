class Party < ActiveRecord::Base
  has_many :games
  belongs_to :user
  belongs_to :place

  def set_place(foursquare_id)
    # p place = Place.where(foursquare_id: foursquare_id)
    p place = Place.create(name: 'hoge', foursquare_id: foursquare_id)
  end
end
