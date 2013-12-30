class CreateGameRecord < ActiveRecord::Migration
  def change
    create_table :game_records do |t|
      t.integer :user_id
      t.integer :game_id
      t.boolean :winner
      t.integer :score

      t.timestamps
    end
  end
end
