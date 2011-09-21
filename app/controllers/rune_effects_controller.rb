class RuneEffectsController < ApplicationController
  load_and_authorize_resource :char_class
  load_and_authorize_resource :skill, :through => :char_class
  load_and_authorize_resource :rune_effect, :through => :skill
  
  respond_to :html, :xml, :json
  
  def index
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:skill_id])
    respond_with(@rune_effects = @skill.rune_effects)
  end
  
  def new
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:skill_id])
    @rune_effect = @skill.rune_effects.build
    @form_action = "Create"
  end
  
  def create
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:skill_id])
    @rune_effect = @skill.rune_effects.build(params[:rune_effect])
    if @rune_effect.save
      flash[:notice] = "Yay!"
      respond_with(@rune_effect, :location => char_class_skill_rune_effect_path(@char,@skill,@rune_effect))
    else
      flash[:error] = "Bummer!"
      redirect_to char_class_skill_rune_effects_path
    end
  end
  
  def show
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:skill_id])
    @rune_effect = RuneEffect.find(params[:id])
  end
  
  def edit
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:skill_id])
    @rune_effect = RuneEffect.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @char = CharClass.find(params[:char_class_id])
    @skill = Skill.find(params[:skill_id])
    @rune_effect = RuneEffect.find(params[:id])
    if @rune_effect.update_attributes(params[:rune_effect])
      flash[:notice] = "Yay!"
      respond_with(@rune_effect, :location => char_class_skill_rune_effect_path(@char,@skill,@rune_effect))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_char_class_skill_rune_effect_path(@rune_effect)
    end
  end
  
  def destroy
    @rune_effect = RuneEffect.find(params[:id])
    if @rune_effect.destroy
      flash[:notice] = "Yay!"
      redirect_to char_class_skill_rune_effect_path
    else
      flash[:error] = "Bummer!"
      redirect_to char_class_skill_rune_effect_path
    end
  end

end


