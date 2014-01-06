class RemoveIdFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :id, :integer
    change_column :places, :foursquare_id, :string, null: false
  end
  add_index :places, :foursquare_id, unique: true
end
