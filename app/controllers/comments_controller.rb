class CommentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :build, :through => :user
  load_and_authorize_resource :comment, :through => :build
  
  respond_to :html, :xml, :json
  
  def new
    @user = User.find(params[:user_id])
    @build = Build.find(params[:build_id])
    @commenter = current_user
    @comment = @build.comments.build
    @form_action = "Post"
  end
  
  def create
    @user = User.find(params[:user_id])
    @build = Build.find(params[:build_id])
    @comments = @build.comments
    @commenter = current_user
    params[:comment][:user_id] = current_user.id
    @comment = @build.comments.build(params[:comment])
    if @comment.save
      if @user.comment_alert?
        #UserMailer.comment_notification(@user,@build,@commenter).deliver
      end
      flash[:notice] = "Comment posted!"
    else
      flash[:error] = "Bummer! Something went wrong!"
      redirect_to user_build_path(@user,@build)
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @build = Build.find(params[:build_id])
    @comment = Comment.find(params[:id])
    @form_action = "Update"
  end

  def update
    @user = User.find(params[:user_id])
    @build = Build.find(params[:build_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment updated!"
      respond_with(@build, :location => user_build_path(@user,@build))
    else
      flash[:error] = "Bummer! Something went wrong!"
      redirect_to user_build_path(@user,@build)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment deleted!"
      respond_with(@build, :location => user_build_path(@user,@build))
    else
      flash[:error] = "Bummer! Something went wrong!"
      redirect_to user_build_path(@user,@build)
    end
  end
end
