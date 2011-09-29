class BuildsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource
  respond_to :html, :xml, :json
  set_tab :allbuilds
  set_tab :mybuilds, :if => :current_user?

  def index
    @user = User.find(params[:user_id])
    respond_with(@builds = @user.builds)
  end

  def new
    @user = User.find(current_user.id)
    @build = @user.builds.build
    9.times do
      build_skills = @build.build_skills.build
    end
    @form_action = "Create Build"
  end

  def create
    @user = User.find(params[:user_id])
    @build = @user.builds.build(params[:build])
    if @build.save
      flash[:notice] = "Build created!"
      respond_with(@build, :location => user_build_path(@user,@build))
    else
      flash[:error] = "Bummer! Something went wrong!"
      redirect_to user_builds_url(@user)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @build = Build.find(params[:id])
    @build_skills = @build.build_skills
  end

  def edit
    @user = User.find(params[:user_id])
    @build = @user.builds.find(params[:id])
    @char = @build.char_class
    @form_action = "Update Build"
  end

  def update
    @user = User.find(params[:user_id])
    @build = Build.find(params[:id])

    if @build.update_attributes(params[:build])
      flash[:notice] = "Build updated"
      respond_with(@build, :location => user_build_path(@user,@build))
    else
      flash[:error] = "Bummer! Something went wrong!"
      redirect_to edit_user_build_path(@user,@build)
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @build = Build.find(params[:id])
    if @build.destroy
      flash[:notice] = "Build deleted!"
      redirect_to user_builds_url(@user)
    else
      flash[:error] = "Bummer! Something went wrong!"
      redirect_to user_builds_url(@user)
    end
  end
  
  def current_user?
    @user = User.find(params[:user_id])
    @user == current_user
  end
end

