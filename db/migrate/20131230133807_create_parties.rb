class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :place_id
      t.date :date

      t.timestamps
    end
  end
end
