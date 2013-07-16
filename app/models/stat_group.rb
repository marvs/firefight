class StatGroup < ActiveRecord::Base
  attr_accessible :creator_id
  
  # Relations
  belongs_to :creator, :class_name => "User"
  has_many :stats
  
end
