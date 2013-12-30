class ChangeVideoColumnInGames < ActiveRecord::Migration
  def self.up
    change_column :games, :video_id, :string
  end

  def self.down
    change_column :games, :video_id, :integer
  end
end
