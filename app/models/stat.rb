class Stat < ActiveRecord::Base
  attr_accessible :donated, :level, :member_id, :received, :record_date, :trophies
  
  # Relations
  belongs_to :member
  belongs_to :stat_group
  
end
