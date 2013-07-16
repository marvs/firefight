class Stat < ActiveRecord::Base
  attr_accessible :donated, :level, :member_id, :received, :record_date, :trophies, :stat_group_id
  
  # Relations
  belongs_to :member
  belongs_to :stat_group
  
end
