class RemovePlaceIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :place_id, :string
  end
end
