class StatGroupsController < ApplicationController
  before_filter :require_admin, :except => [:index, :show]
  before_filter :set_navbar_active

  def index
    @stat_groups = StatGroup.order('created_at DESC').all
  end
  
  def show
    @stat_group = StatGroup.find(params[:id])
  end
  
  def new
    @stat_group = StatGroup.new
    @stats = []
    last_stat = StatGroup.last
    if last_stat.nil? || !last_stat.stats.any?
      # Try to create a new form
      # Get top 50 members, sorted by trophy count
      members = Member.clan_members.all
      members.each do |mem|
        @stats << Stat.new({:member_id => mem.id})
      end
    else
      # Create the form based on the last data
      prev_stats = last_stat.stats.order("trophies DESC").all
      prev_stats.each do |ps|
        if ps.member && ps.member.active
          attrs = { level: ps.level, donated: ps.donated, received: ps.received, 
                    trophies: ps.trophies, member_id: ps.member_id }
          @stats << Stat.new(attrs)
        end
      end
    end
    if @stats.size < 50
      @new_members = Member.clan_members.all - @stat_group.stats.map(&:member) rescue []
      (50 - @stats.size).times do
        @stats << Stat.new
      end
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
      mem = Member.clan_members.where(id: mid).first
      if mem && mem.active
        stat = Stat.new(stat_group_id: @stat_group.id, member_id: mid)
        stat.level = levels[index]
        stat.donated = donated[index]
        stat.received = received[index]
        stat.trophies = trophies[index]
        stat.save!
      end
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
        @new_members = Member.clan_members.all - @stat_group.stats.map(&:member) rescue []
        (50 - @stats.size).times do
          @stats << Stat.new(stat_group_id: @stat_group.id)
        end
      end
    else
      redirect_to :action => :index
    end
  end
  
  def update
    @stat_group = StatGroup.find(params[:id])
    if @stat_group
      members = params[:member_id]
      levels = params[:level]
      donated = params[:donated]
      received = params[:received]
      trophies = params[:trophies]
      members.each_with_index do |mid, index|
        mem = Member.clan_members.where(id: mid).first
        if mem && mem.active
          stat = Stat.find_or_create_by_stat_group_id_and_member_id(@stat_group.id, mid)
          stat.level = levels[index]
          stat.donated = donated[index]
          stat.received = received[index]
          stat.trophies = trophies[index]
          stat.save!
        end
      end
    end  
    redirect_to :action => :index
  end
  
  def destroy
    @stat_group = StatGroup.find(params[:id])
    created_on = @stat_group.created_at
    @stat_group.destroy
    redirect_to stat_groups_path, :notice => "Deleted StatGroup created on #{created_on.to_s}!"
  end
  
  
private
  def set_navbar_active
    @navbar_active = "stats"
  end  
  
end
