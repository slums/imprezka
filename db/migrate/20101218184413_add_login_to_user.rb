class AddLoginToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :string
    add_column :users, :pass_hash, :string
  end

  def self.down
    remove_column :users, :pass_hash
    remove_column :users, :login
  end
end
