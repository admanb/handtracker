class TemplatesController < ApplicationController
  
  before_filter :user_status, :except => [:new, :create]
  before_filter :authorized, :except => [:new, :create, :show]
  
  def show
    @tpl = Template.find(params[:id])
  end
  
  def new
    @tpl = Template.new
  end
  
  def create
    @tpl = Template.new(params[:template])
    @tpl.user = @user
    if @tpl.save
      flash[:notice] = "Template created."
      redirect_to template_url(@tpl)
    else
      render :action => 'new'
    end
  end

  def edit
    @tpl = Template.find(params[:id])
  end
  
  def update
    @tpl = Template.find(params[:id])
    if @tpl.update_attributes(params[:template])
      flash[:notice] = "Template updated."
      redirect_to template_url(@tpl)
    else
      render :action => 'edit'
    end
  end

  def toggle_public
    @tpl = Template.find(params[:id])
    @tpl.update_attribute(:public, params[:public])
    flash[:notice] = "Public toggled."
    redirect_to template_url(@tpl)
  end
  
  private
  
  def user_status
    @tpl = Template.find(params[:id])
    @tpl.user == @user ? @owner = true : @owner = false
  end
    
  def authorized
    if !@owner
      flash[:notice] = 'You do not own this template.'
      redirect_to template_url(@tpl)
    end
  end
  
end