class SkillsController < ApplicationController

  respond_to :html, :xml, :json
  
  def index
    respond_with(@skills = Skill.all)
  end
  
  def new
    @skill = Skill.new
    @form_action = "Create"
  end
  
  def create
    @skill = Skill.new(params[:skill])
    if @skill.save
      flash[:notice] = "Yay!"
      respond_with(@skill, :location => skill_path(@skill))
    else
      flash[:error] = "Bummer!"
      redirect_to skill_path
    end
  end
  
  def show
    @skill = Skill.find(params[:id])
  end
  
  def edit
    @skill = Skill.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @skill = Skill.find(params[:id])
    if @skill.update_attributes(params[:skill])
      flash[:notice] = "Yay!"
      respond_with(@skill, :location => skill_path(@skill))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_skill_path(@skill)
    end
  end
  
  def destroy
    @skill = Skill.find(params[:id])
    if @skill.destroy
      flash[:notice] = "Yay!"
      redirect_to skills_url
    else
      flash[:error] = "Bummer!"
      redirect_to skills_url
    end
  end

end

