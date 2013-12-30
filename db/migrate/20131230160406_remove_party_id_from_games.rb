class RemovePartyIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :party_id, :integer
  end
end
