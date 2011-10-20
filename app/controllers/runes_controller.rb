class RunesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :xml, :json
  
  def index
    respond_with(@runes = Rune.all)
  end
  
  def new
    @rune = Rune.new
    @form_action = "Create"
  end
  
  def create
    @rune = Rune.new(params[:rune])
    if @rune.save
      flash[:notice] = "Yay!"
      respond_with(@rune, :location => rune_path(@rune))
    else
      flash[:error] = "Bummer!"
      redirect_to runes_path
    end
  end
  
  def show
    @rune = Rune.find(params[:id])
  end
  
  def edit
    @rune = Rune.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @rune = Rune.find(params[:id])
    if @rune.update_attributes(params[:rune])
      flash[:notice] = "Yay!"
      respond_with(@rune, :location => rune_path(@rune))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_rune_path(@rune)
    end
  end
  
  def destroy
    @rune = Rune.find(params[:id])
    if @rune.destroy
      flash[:notice] = "Yay!"
      redirect_to runes_path
    else
      flash[:error] = "Bummer!"
      redirect_to runes_path
    end
  end

end


