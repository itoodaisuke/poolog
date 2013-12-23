class CreateGameMembers < ActiveRecord::Migration
  def change
    create_table :game_members do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
