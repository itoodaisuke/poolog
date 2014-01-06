class Place < ActiveRecord::Base
  has_many :parties
  self.primary_key = :foursquare_id

  def search_venues(ll=nil)
    @foursquare ||= Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_KEY'], :client_secret => ENV['FOURSQUARE_SECRET'])
    @foursquare.search_venues(:categoryId=>ENV['FOURSQUARE_POOLHALL_ID'], :intent=>'browse', :near=>'Tokyo')
  end
end
