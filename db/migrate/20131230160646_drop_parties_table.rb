class DropPartiesTable < ActiveRecord::Migration
  def self.up
    drop_table :parties_users
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
