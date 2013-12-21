class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.date :date
      t.string :place

      t.timestamps
    end
  end
end
