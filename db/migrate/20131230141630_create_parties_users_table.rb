class CreatePartiesUsersTable < ActiveRecord::Migration
  def change
    create_table :parties_users, :id=>false do |t|
      t.references :party
      t.references :user
    end
  end
end
