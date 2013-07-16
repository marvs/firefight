class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :level
      t.integer :donated
      t.integer :received
      t.integer :trophies
      t.integer :member_id

      t.timestamps
    end
  end
end
