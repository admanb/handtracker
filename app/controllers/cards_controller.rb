class CardsController < ApplicationController
  
  before_filter :user_status
  before_filter :authorized
  
  def new
    @tpl = Template.find(params[:template_id])
    @card = Card.new()
  end
  
  def create
    @tpl = Template.find(params[:template_id])
    cards = params[:card][:text].split(';') # separate by semi-colons
    cards.each {|c| c.strip!} #strip leading and trailing whitespace
    cards.delete("") # delete if it's blank
    cards.each do |c|
      new_card = Card.new(:text => c)
      new_card.template = @tpl
      new_card.save
    end
    redirect_to template_url(@tpl)
  end
  
  def destroy
    @tpl = Template.find(params[:template_id])
    @card = Card.find(params[:id])
    @card.destroy
    flash[:notice] = 'Card destroyed.'
    redirect_to template_url(@tpl)
  end
  
  def copy
    @tpl = Template.find(params[:template_id])
    @card = Card.find(params[:id])
    new_card = Card.new(:text => @card.text, :template => @tpl)
    new_card.save
    flash[:notice] = 'Card copied.'
    redirect_to template_url(@tpl)
  end
  
  def edit
    @tpl = Template.find(params[:template_id])
    @card = Card.find(params[:id])
  end
  
  def update
    @tpl = Template.find(params[:template_id])
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      flash[:notice] = 'Card updated.'
      redirect_to template_url(@tpl)
    else
      render :action => 'edit'
    end
  end
  
  private
  
  def user_status
    @tpl = Template.find(params[:template_id])
    @tpl.user == @user ? @owner = true : @owner = false
  end
    
  def authorized
    if !@owner
      flash[:notice] = 'You do not own this template.'
      redirect_to template_url(@tpl)
    end
  end
end