class Member < ActiveRecord::Base
  attr_accessible :active, :name, :elder
  
  scope :elders, where(elder: true)
  scope :clan_members, where(active: true)
  
  # Relations
  has_many :stats
  
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
