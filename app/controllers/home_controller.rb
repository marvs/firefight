class HomeController < ApplicationController

  def index
    @navbar_active = "home"
  end
  
  def about
    @navbar_active = "about"
  end
  
  def sleep
    if [16,17,18,19,20,21,22,23,0].include?(Time.now.utc.hour)
      @sleep = true
    else
      @sleep = false
    end
    render :layout => false
  end
  
end
