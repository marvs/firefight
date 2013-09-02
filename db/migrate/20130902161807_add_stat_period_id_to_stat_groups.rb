class AddStatPeriodIdToStatGroups < ActiveRecord::Migration
  def change
    add_column :stat_groups, :stat_period_id, :integer
  end
end
