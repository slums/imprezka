class AddCommercialToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :commercial, :boolean
  end

  def self.down
    remove_column :users, :commercial
  end
end
