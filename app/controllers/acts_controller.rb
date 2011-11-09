class ActsController < ApplicationController
  
  before_filter :restricted_acts
  
  def show
    @act = Act.find(params[:id])
    @game = Game.find(params[:game_id])
    @act_owner = User.find(@act.user)
  end 
  
  private
  
  def restricted_acts
    act = Act.find(params[:id])
    act_owner = act.user
    game = Game.find(params[:game_id])
    if (act_owner != @user) && (@user != game.host) && act.restricted?
      flash[:notice] = "That act isn\'t visible to you."
      @user ? redirect_to(game) : redirect_to(login_url)
    end
  end
  
end