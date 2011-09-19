class ForkBuildsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :xml, :json
  
  def new
    @user = User.find(current_user.id)
    @old_build = Build.find(params[:id])
    @build = @old_build.dup
    6.times do
      build_skills = @build.build_skills.build
    end
    @form_action = "Create"
  end
  
  def create
    @user = User.find(current_user.id)
    @build = @user.builds.build(params[:build])
    if @build.save
      flash[:notice] = "Yay!"
      respond_with(@build, :location => user_build_path(@user,@build))
    else
      flash[:error] = "Bummer!"
      redirect_to user_path
    end
  end
end

