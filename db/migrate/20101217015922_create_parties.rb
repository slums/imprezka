class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.boolean :commercial
      t.string :for_who
      t.string :place
      t.datetime :when
      t.binary :photo1, :limit => 262144
      t.binary :photo2, :limit => 262144

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
