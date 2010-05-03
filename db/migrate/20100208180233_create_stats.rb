class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :GU
      t.integer :SA_Long
      t.integer :SA_Short
      t.integer :Macs
      t.integer :Scanners
      t.integer :LL
      t.integer :Video
      t.string :User
      t.text :Comment
      t.datetime :Slot

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
