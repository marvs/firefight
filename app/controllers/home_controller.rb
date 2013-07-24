class HomeController < ApplicationController

  def index
    @navbar_active = "home"
  end
  
  def about
    @navbar_active = "about"
  end
  
end
