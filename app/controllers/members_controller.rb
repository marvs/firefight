class MembersController < ApplicationController

  def index
    @members = Member.order(:name)
  end
  
  def new
    @member = Member.new
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
  
end
