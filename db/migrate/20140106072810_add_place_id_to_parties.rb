class AddPlaceIdToParties < ActiveRecord::Migration
  def change
    add_column :parties, :place_id, :integer
  end
end
