class StatGroupsController < ApplicationController

  def index
  end
  
  def new
    @stat_group = StatGroup.new
    @stats = []
    50.times do
      @stats << Stat.new
    end
  end
  
  def create
    debugger
  end
  
  def edit
  end
  
  def update
  end
  
end
