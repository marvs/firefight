class StatGroup < ActiveRecord::Base
  attr_accessible :creator_id, :stat_period_id
  
  # Relations
  belongs_to :creator, :class_name => "User"
  belongs_to :stat_period
  has_many :stats
  
  scope :recent_first, order("created_at DESC")
  
end
