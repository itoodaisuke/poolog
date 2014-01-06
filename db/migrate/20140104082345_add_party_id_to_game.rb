class AddPartyIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :party_id, :integer
  end
end
