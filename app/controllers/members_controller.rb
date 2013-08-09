class MembersController < ApplicationController
  before_filter :require_admin, :except => [:index, :show, :get_troops_stats, :get_trophies_stats]
  before_filter :set_navbar_active

  def index
    @members = Member.order(:name)
  end
  
  def new
    @member = Member.new
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to :action => :index
    else
      render :new
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      redirect_to :action => :index
    else
      render :edit
    end
  end
  
  def get_troops_stats
    @member = Member.find(params[:id])
    donated = []
    received = []
    data = []
    @member.stats.each do |stat|
      donated << { x: stat.created_at.utc.to_date.to_s, y: stat.donated }
      received << { x: stat.created_at.utc.to_date.to_s, y: stat.received }
    end
    # Or use (Time.now.to_f * 1000).to_i instead of javascript getTime()ss
    data << { values: donated, key: "Troops Donated", color: '#00FF00' }
    data << { values: received, key: "Troops Received", color: '#FF0000' }
    render :json => data
  end
  
  def get_trophies_stats
    @member = Member.find(params[:id])
    trophies = []
    data = []
    @member.stats.each do |stat|
      trophies << { x: stat.created_at.utc.to_date.to_s, y: stat.trophies }
    end
    data << { values: trophies, key: "Trophies", color: '#00FF00' }
    render :json => data
  end
  
  
private
  def set_navbar_active
    @navbar_active = "members"
  end  
  
end
