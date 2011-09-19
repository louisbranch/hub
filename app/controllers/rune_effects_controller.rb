class RuneEffectsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :xml, :json
  
  def index
    respond_with(@rune_effects = RuneEffect.all)
  end
  
  def new
    @rune_effect = RuneEffect.new
    @form_action = "Create"
  end
  
  def create
    @rune_effect = RuneEffect.new(params[:rune_effect])
    if @rune_effect.save
      flash[:notice] = "Yay!"
      respond_with(@rune_effect, :location => rune_effect_path(@rune_effect))
    else
      flash[:error] = "Bummer!"
      redirect_to rune_effect_path
    end
  end
  
  def show
    @rune_effect = RuneEffect.find(params[:id])
  end
  
  def edit
    @rune_effect = RuneEffect.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @rune_effect = RuneEffect.find(params[:id])
    if @rune_effect.update_attributes(params[:rune_effect])
      flash[:notice] = "Yay!"
      respond_with(@rune_effect, :location => rune_effect_path(@rune_effect))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_rune_effect_path(@rune_effect)
    end
  end
  
  def destroy
    @rune_effect = RuneEffect.find(params[:id])
    if @rune_effect.destroy
      flash[:notice] = "Yay!"
      redirect_to rune_effects_url
    else
      flash[:error] = "Bummer!"
      redirect_to rune_effects_url
    end
  end

end


