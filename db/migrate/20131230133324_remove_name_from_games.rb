class RemoveNameFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :name, :string
    remove_column :games, :date, :date
    remove_column :games, :place, :string
  end
end
