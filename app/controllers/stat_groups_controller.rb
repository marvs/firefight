class StatGroupsController < ApplicationController

  def index
    @stat_groups = StatGroup.all
  end
  
  def new
    @stat_group = StatGroup.new
    @stats = []
    if StatGroup.last.nil?
      # Try to create a new form
      # Get top 50 members, sorted by trophy count
      @members = Member.all.map{ |m| [m.name, m.id] }
      50.times do
        @stats << Stat.new
      end
    else
      # Create the form based on the last data
    end
  end
  
  def create
    members = params[:member_id]
    levels = params[:level]
    donated = params[:donated]
    received = params[:received]
    trophies = params[:trophies]
    @stat_group = StatGroup.create!(:creator_id => 1)
    members.each_with_index do |mid, index|
      stat = Stat.new(stat_group_id: @stat_group.id, member_id: mid)
      stat.level = levels[index]
      stat.donated = donated[index]
      stat.received = received[index]
      stat.trophies = trophies[index]
      stat.save!
    end
    redirect_to :action => :index
  end
  
  def edit
    @stat_group = StatGroup.find(params[:id])
    if @stat_group
      @members = []
      @stats = @stat_group.stats.order("trophies DESC, id ASC").all
      @stats.each do |stat|
        @members << [stat.member.name, stat.member.id] if stat.member
      end
      if @stats.size < 50
        (50 - @stats.size).times do
          @stats << Stat.new(stat_group_id: @stat_group.id)
        end
      end
    else
      redirect_to :action => :index
    end
  end
  
  def update
  end
  
end
