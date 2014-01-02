class ChangeUidColumnToBigInt < ActiveRecord::Migration
  def self.up
    change_column :users, :uid, :bigint
  end

  def self.down
    change_column :users, :uid, :integer
  end
end
