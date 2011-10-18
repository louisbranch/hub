class Users::SessionsController < Devise::SessionsController
  load_and_authorize_resource
  respond_to :html, :xml, :json
  
  def index
    respond_with(@users = User.all)
  end
  
  def show
    @user = User.find(params[:id])
  end
end



