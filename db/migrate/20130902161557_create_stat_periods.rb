class CreateStatPeriods < ActiveRecord::Migration
  def change
    create_table :stat_periods do |t|
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
