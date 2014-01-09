class Place < ActiveRecord::Base
  has_many :parties
  self.primary_key = :foursquare_id
end
