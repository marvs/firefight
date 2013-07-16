class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.boolean :active, :default => true
      t.boolean :elder, :default => false

      t.timestamps
    end
  end
end
