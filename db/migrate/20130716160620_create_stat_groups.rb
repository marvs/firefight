class CreateStatGroups < ActiveRecord::Migration
  def change
    create_table :stat_groups do |t|
      t.integer :creator_id

      t.timestamps
    end
  end
end
