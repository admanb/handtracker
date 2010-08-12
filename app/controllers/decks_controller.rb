class DecksController < ApplicationController
  
  before_filter :user_status
  
  # GET /decks
  # GET /decks.xml
  def index
    @decks = Deck.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @decks }
    end
  end

  # GET /decks/1/edit
  def edit
    @deck = Deck.find(params[:id])
  end

  # PUT /decks/1
  # PUT /decks/1.xml
  def update
    @deck = Deck.find(params[:id])
    @game = Game.find(params[:game_id])
    @deck.shuffle
    redirect_to game_url(@game)
  end

  def draw
    @deck = Deck.find(params[:id])
    @game = Game.find(params[:game_id])
    drawn_card = @deck.first_card
    @act = Act.new(:card_state => drawn_card, :game => @game, :user => @user, :act_type => params[:act], :position => @game.next_act_position)
    @act.save
    if params[:act] == 'draw_to_hand'
      drawn_card.move_to_hand(@user)
    elsif params[:act] == 'play_from_deck'
      drawn_card.move_to_discard()
    end
    if @deck.empty_draw?
      @deck.shuffle
    else
      @deck.save
      @deck.get_draw.each do |c|
        c.update_attribute(:position, c.position-1)
      end
    end
    redirect_to game_act_url(@game, @act)
  end
  
  def destroy
    @deck = Deck.find(params[:id])
    @game = Game.find(params[:game_id])
    @deck.destroy
    flash[:notice] = 'Deck destroyed'
    redirect_to game_url(@game)
  end
  
  private

  def user_status
    @game = Game.find(params[:game_id])
    if !(@game.players.exists?(@user) || @game.host == @user)
      flash[:notice] = 'You are not a player in that game.'
      @user ? redirect_to(@user) : redirect_to(login_url)
    end
  end
end
