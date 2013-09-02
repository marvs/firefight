class StatPeriodsController < ApplicationController
  before_filter :require_admin
  before_filter :set_navbar_active

  def index
    @stat_periods = StatPeriod.order('created_at DESC').all
  end
  
  def new
    @stat_period = StatPeriod.new
  end
  
  def create
    @stat_period = StatPeriod.new(params[:stat_period])
    if @stat_period.save
      flash[:notice] = "Created stat period!"
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @stat_period = StatPeriod.find(params[:id])
  end
  
  def update
    @stat_period = StatPeriod.find(params[:id])
    if @stat_period.update_attributes(params[:stat_period])
      flash[:notice] = "Updated stat period!"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    @stat_period = StatPeriod.find(params[:id])
    created_on = @stat_period.created_at
    @stat_period.destroy
    redirect_to stat_periods_path, :notice => "Deleted StatPeriod created on #{created_on.to_s}!"
  end
  
  
private
  def set_navbar_active
    @navbar_active = "stats"
  end  
  
end
