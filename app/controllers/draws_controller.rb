class DrawsController < ApplicationController
  
  before_filter :owner_or_host
  
  def show
    @draw = Draw.find(params[:id])
    @game = Game.find(params[:game_id])
    @draw_owner = User.find(@draw.user)
  end 
  
  private
  
  def owner_or_host
    draw_owner = Draw.find(params[:id]).user
    game = Game.find(params[:game_id])
    if (draw_owner != @user) && (@user != game.host)
      flash[:notice] = "That draw doesn\'t belong to you."
      @user ? redirect_to(user_url(@user)) : redirect_to(login_url)
    end
  end
  
end