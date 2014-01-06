class RemoveDateFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :date, :date
  end
end
