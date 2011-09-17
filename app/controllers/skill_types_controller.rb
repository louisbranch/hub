class SkillTypesController < ApplicationController

  respond_to :html, :xml, :json
  
  def index
    respond_with(@skill_types = SkillType.all)
  end
  
  def new
    @skill_type = SkillType.new
    @form_action = "Create"
  end
  
  def create
    @skill_type = SkillType.new(params[:skill_type])
    if @skill_type.save
      flash[:notice] = "Yay!"
      respond_with(@skill_type, :location => skill_type_path(@skill_type))
    else
      flash[:error] = "Bummer!"
      redirect_to skill_type_path
    end
  end
  
  def show
    @skill_type = SkillType.find(params[:id])
  end
  
  def edit
    @skill_type = SkillType.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @skill_type = SkillType.find(params[:id])
    if @skill_type.update_attributes(params[:skill])
      flash[:notice] = "Yay!"
      respond_with(@skill_type, :location => skill_type_path(@skill_type))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_skill_type_path(@skill_type)
    end
  end
  
  def destroy
    @skill_type = SkillType.find(params[:id])
    if @skill_type.destroy
      flash[:notice] = "Yay!"
      redirect_to skill_types_url
    else
      flash[:error] = "Bummer!"
      redirect_to skill_types_url
    end
  end

end


