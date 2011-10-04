class PagesController < ApplicationController
  set_tab :allbuilds
  
  def index
    @title = "Create, share and discover Diablo 3 builds"
    @chars = CharClass.all
    @newbuilds = Build.order("created_at DESC").limit(5)
    render :layout => "home"
  end
  
  def builds
    @title = "Explore all Diablo 3 builds"
    @builds = Build.order("updated_at DESC").limit(50)
  end
  
end
