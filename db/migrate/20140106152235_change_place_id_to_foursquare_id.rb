class ChangePlaceIdToFoursquareId < ActiveRecord::Migration
  def change
    remove_column :parties, :place_id, :string
    add_column :parties, :foursquare_id, :string
  end
end
