class Member < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :active, :name, :elder
  
  scope :elders, where(elder: true)
  scope :clan_members, where(active: true)
  
  # Relations
  has_many :stats
  
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def member?
    self.active == true
  end
  
  def get_stats
    self.stats.recent_first
  end
  
end
