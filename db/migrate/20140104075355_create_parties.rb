class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.date :date
      t.references :user

      t.timestamps
    end
    add_index(:parties,[:date,:user_id],:unique => true)
  end
end
