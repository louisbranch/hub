class PagesController < ApplicationController

  def index
  
    @chars = CharClass.all
  
  end
  
  def builds
  
    @builds = Build.all
  
  end
  
end
