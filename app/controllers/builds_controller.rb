class BuildsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource
  respond_to :html, :xml, :json
  set_tab :mybuilds
  
  def index
    @user = User.find(params[:user_id])
    respond_with(@builds = @user.builds)
  end
  
  def new
    @user = User.find(current_user.id)
    @build = @user.builds.build
    6.times do
      build_skills = @build.build_skills.build
    end
    @form_action = "Create"
  end
  
  def create
    @user = User.find(params[:user_id])
    @build = @user.builds.build(params[:build])
    if @build.save
      flash[:notice] = "Yay!"
      respond_with(@build, :location => user_build_path(@user,@build))
    else
      flash[:error] = "Bummer!"
      redirect_to user_builds_url(@user)
    end
  end
  
  def show
    @build = Build.find(params[:id])
    @skills = @build.build_skills
  end
  
  def edit
    @user = User.find(params[:user_id])
    @build = @user.builds.find(params[:id])
    6.times do
      build_skills = @build.build_skills.build
    end
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
