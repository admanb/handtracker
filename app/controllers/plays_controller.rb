class PlaysController < ApplicationController
  
  def show
    @play = Play.find(params[:id])
    @game = Game.find(params[:game_id])
    @play_owner = User.find(@play.user)
  end
  
end