class CharClassesController < ApplicationController

  respond_to :html, :xml, :json
  
  def index
    respond_with(@chars = CharClass.all)
  end
  
  def new
    @char = CharClass.new
    @form_action = "Create"
  end
  
  def create
    @char = CharClass.new(params[:char_class])
    if @char.save
      flash[:notice] = "Yay!"
      respond_with(@char, :location => char_class_path(@char))
    else
      flash[:error] = "Bummer!"
      redirect_to new_char_class_path
    end
  end
  
  def show
    @char = CharClass.find(params[:id])
    @skills = @char.skills
  end
  
  def edit
    @char = CharClass.find(params[:id])
    @form_action = "Update"
  end
  
  def update
    @char = CharClass.find(params[:id])
    if @char.update_attributes(params[:char_class])
      flash[:notice] = "Yay!"
      respond_with(@char, :location => char_class_path(@char))
    else
      flash[:error] = "Bummer!"
      redirect_to edit_char_class_path(@char)
    end
  end
  
  def destroy
    @char = CharClass.find(params[:id])
    if @char.destroy
      flash[:notice] = "Yay!"
      redirect_to char_classes_url
    else
      flash[:error] = "Bummer!"
      redirect_to char_classes_url
    end
  end

end
