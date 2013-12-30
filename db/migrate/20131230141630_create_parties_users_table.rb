class CreatePartiesUsersTable < ActiveRecord::Migration
  def change
    create_table :parties_users_tables, :id=>false do |t|
      t.references :parties
      t.references :users
    end
  end
end
