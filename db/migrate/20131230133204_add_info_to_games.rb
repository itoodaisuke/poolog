class AddInfoToGames < ActiveRecord::Migration
  def change
    add_column :games, :party_id, :integer
    add_column :games, :rule, :string
    add_column :games, :video_id, :integer
  end
end
