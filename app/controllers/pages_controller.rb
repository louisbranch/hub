class PagesController < ApplicationController

  def index
    
    @title = "Create, share and discovery Diablo 3 builds"
    @chars = CharClass.all
  
  end
  
  def builds
  
    @title = "Explore all Diablo 3 builds"
    @builds = Build.all
  
  end
  
end
