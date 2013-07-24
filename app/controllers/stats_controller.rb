class StatsController < ApplicationController
  before_filter :set_navbar_active

  def top_rankings
    @stat_groups = StatGroup.all
  end
  
private
  def set_navbar_active
    @navbar_active = "stats"
  end  
  
end
