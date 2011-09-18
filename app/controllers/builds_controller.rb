class BuildsController < ApplicationController

  respond_to :html, :xml, :json
  
  def index
    respond_with(@builds = Build.all)
  end
  
  def new
    @build = Build.new
    6.times do
      build_skills = @build.build_skills.build
    end
    @form_action = "Create"
  end
  
  def create
    @build = Build.new(params[:build])
    if @build.save
      flash[:notice] = "Yay!"
      respond_with(@build, :location => build_path(@build))
    else
      flash[:error] = "Bummer!"
      redirect_to build_path
    end
  end
  
  def show
    @build = Build.find(params[:id])
    @skills = @build.build_skills
  end
  
  def edit
    @build = Build.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @build = Build.find(params[:id])
    if @build.update_attributes(params[:build])
      flash[:notice] = "Yay!"
      respond_with(@build, :location => build_path(@build))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_build_path(@build)
    end
  end
  
  def destroy
    @build = Build.find(params[:id])
    if @build.destroy
      flash[:notice] = "Yay!"
      redirect_to builds_url
    else
      flash[:error] = "Bummer!"
      redirect_to builds_url
    end
  end

end
