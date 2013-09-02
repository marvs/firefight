class StatPeriod < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date
  
  # Validations
  validates_presence_of :start_date, :end_date, :name
  
  # Relations
  has_many :stat_groups
  
  # Scope
  scope :recent_first, order("created_at DESC")
  
end
