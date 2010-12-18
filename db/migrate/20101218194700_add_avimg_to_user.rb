class AddAvimgToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :av_img, :binary
  end

  def self.down
    remove_column :users, :av_img
  end
end
