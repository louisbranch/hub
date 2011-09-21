class PagesController < ApplicationController
  set_tab :allbuilds
  
  def index
    @title = "Create, share and discovery Diablo 3 builds"
    @chars = CharClass.all
    render :layout => "home"
  end
  
  def builds
  
    @title = "Explore all Diablo 3 builds"
    @builds = Build.all
  
  end
  
end
