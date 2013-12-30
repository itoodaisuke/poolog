class AddPlaceIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :place_id, :string
  end
end
