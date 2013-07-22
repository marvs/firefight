class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :max_trophies, :max_levels, :max_donations, :admin_user?
  
  def require_admin
    redirect_to root_path unless admin_user?
  end
  
  def admin_user?
    user_signed_in? && current_user.admin?
  end
  
  def max_trophies(limit=5)
    @max_trophies = []
    Member.clan_members.each do |mem|
      highest_stat = Stat.with_trophies.where(member_id: mem.id).order("trophies DESC").limit(1).first
      if highest_stat
        @max_trophies << highest_stat
      end
    end
    @max_trophies.sort_by(&:trophies).reverse.take(limit) rescue []
  end
  
  def max_levels(limit=5)
    @max_levels = []
    Member.clan_members.each do |mem|
      highest_stat = Stat.with_levels.where(member_id: mem.id).order("level DESC").limit(1).first
      if highest_stat
        @max_levels << highest_stat
      end
    end
    @max_levels.sort_by(&:level).reverse.take(limit) rescue []
  end
  
  def max_donations(limit=5)
    @max_donations = []
    Member.clan_members.each do |mem|
      highest_stat = Stat.with_donations.where(member_id: mem.id).order("donated DESC").limit(1).first
      if highest_stat
        @max_donations << highest_stat
      end
    end
    @max_donations.sort_by(&:donated).reverse.take(limit) rescue []
  end
  
end
