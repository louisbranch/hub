class BuildTypesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :xml, :json
  set_tab :allbuilds
  
  def index
    respond_with(@types = BuildType.all)
  end
  
  def new
    @type = BuildType.new
    @form_action = "Create"
  end
  
  def create
    @type = BuildType.new(params[:build_type])
    if @type.save
      flash[:notice] = "Yay!"
      respond_with(@type, :location => build_type_path(@type))
    else
      flash[:error] = "Bummer!"
      redirect_to build_types_path
    end
  end
  
  def show
    @type = BuildType.find(params[:id])
  end
  
  def edit
    @type = BuildType.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @type = BuildType.find(params[:id])
    if @type.update_attributes(params[:build_type])
      flash[:notice] = "Yay!"
      respond_with(@type, :location => BuildType_path(@type))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_build_type_path(@type)
    end
  end
  
  def destroy
    @type = BuildType.find(params[:id])
    if @type.destroy
      flash[:notice] = "Yay!"
      redirect_to build_types_path
    else
      flash[:error] = "Bummer!"
      redirect_to build_types_path
    end
  end
  
  def builds
    @build_type = BuildType.find(params[:id])
    @builds = @build_type.builds.sort_by(&:popularity).reverse
    @title = "#{@build_type.name} - Explore all #{@build_type.acronym} builds from Diablo 3"
  end

end


