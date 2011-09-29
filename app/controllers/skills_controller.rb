class SkillsController < ApplicationController
  load_and_authorize_resource :char_class
  load_and_authorize_resource :skill, :through => :char_class

  respond_to :html, :xml, :json
  set_tab :classes

  def index
    @char = CharClass.find(params[:char_class_id])
    @skills = @char.skills
    render :layout => nil
  end

  def new
    @char = CharClass.find(params[:char_class_id])
    @skill = @char.skills.build
    @form_action = "Create"
  end

  def create
    @char = CharClass.find(params[:char_class_id])
    @skill = @char.skills.build(params[:skill])
    if @skill.save
      flash[:notice] = "Yay!"
      respond_with(@skill, :location => char_class_skill_path(@char,@skill))
    else
      flash[:error] = "Bummer!"
      redirect_to char_class_skills_url
    end
  end

  def show
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:id])
    @rune_effects = @skill.rune_effects
    render :layout => nil
  end

  def edit
    @char = CharClass.find(params[:char_class_id])
    @skill = @char.skills.find(params[:id])
    @form_action = "Update"
  end

  def update
    @char = CharClass.find(params[:char_class_id])
    @skill = @char.skills.find(params[:id])
    if @skill.update_attributes(params[:skill])
      flash[:notice] = "Yay!"
      respond_with(@skill, :location => char_class_skill_path(@char,@skill))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_char_class_skill_path(@char,@skill)
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    if @skill.destroy
      flash[:notice] = "Yay!"
      redirect_to char_class_skills_url
    else
      flash[:error] = "Bummer!"
      redirect_to char_class_skills_url
    end
  end

  def actives
    @char = CharClass.find(params[:char_class_id])
    @skill_types = @char.skill_types
    render :layout => nil
  end

  def passives
    @char = CharClass.find(params[:char_class_id])
    @skills = @char.skills
    render :layout => nil
  end

  def tooltip
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:id])
    @rune_effects = @skill.rune_effects
    render :layout => nil
  end



  def drilldown
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:id])
    @rune_effects = @skill.rune_effects
    render :layout => nil
  end

end

