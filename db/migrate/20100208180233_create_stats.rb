class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :gu
      t.integer :sa_long
      t.integer :sa_short
      t.integer :macs
      t.integer :scanners
      t.integer :ll
      t.integer :video
      t.integer :ref
      t.integer :user_id
      t.integer :eod_door
      t.text :comment
      t.date :date
      t.string :time

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
