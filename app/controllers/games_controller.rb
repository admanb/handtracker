class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  # def index
  #   @games = Game.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @games }
  #   end
  # end

  # GET /games/1
  # GET /games/1.xml
  
  before_filter :user_status, :except => [:new, :create]
  
  def show
    @game = Game.find(params[:id])
    @deck = @game.deck
    @current_players = @game.players.to_a
    @current_players << @game.host
    @available_players = User.find(:all) - @current_players
    @discarded = @deck.discarded_cards
    @available = @deck.available_cards
    if(@host)
      @draws = Draw.find_all_by_game_id(@game, :order => 'id DESC')
    else
      @draws = Draw.find_all_by_game_id_and_user_id(@game, @user, :order => 'id DESC')
    end
    @plays = Play.find_all_by_game_id(@game, :order => 'id DESC')
    @hand = @user.card_in_hands.find_all {|card| card.deck.game == @game}
    if @draws == nil
      @draws = []
    end
    if @hand == nil
      @hand = []
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  def add_player
    @player = User.find(params[:new_player])
    @game = Game.find(params[:id])
    @game.players << @player
    if @game.save
      flash[:notice] = "Player added."
      redirect_to(@game)
    else
      flash[:notice] = "Something went wrong. The player wasn't added."
      redirect_to(@game)
    end
  end

  def remove_player
    @player = User.find(params[:player_id])
    
    # This is a bit ass
    @game = Game.find(params[:id])
    @deck = @game.deck
    players_hand = @player.card_in_hands.find_all {|card| card.deck.game == @game}
    players_hand.each do |a|
      @player.cards.delete(a.card)
      discard = DiscardedCard.new(:deck => @deck, :card => a.card, :position => DiscardedCard.find_new_position(@deck))
      @deck.discarded_cards << discard
      @user.save
      @deck.save
    end
    
    @game = Game.find(params[:id])
    @game.players.delete(@player)
    if @game.save
      flash[:notice] = "Player removed."
      redirect_to(@game)
    else
      flash[:notice] = "Something went wrong. The player wasn't removed."
      redirect_to(@game)
    end
  end

  def undo
    
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new
    @templates = Template.find_public_and_own(@user.id)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])
    @game.host = @user
    @game.deck = Deck.new_from_template(params[:template_id])
    respond_to do |format|
      if @game.save
        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to(@game) }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    players = @game.players << @game.host
    players.each do |p|
      hand = p.card_in_hands.find_all {|card| card.deck.game == @game}
      hand.each do |a|
        p.cards.delete(a.card)
      end
      @user.save
    end
    @game.destroy
      
    respond_to do |format|
      format.html { redirect_to(user_url(@user)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def user_status
    @game = Game.find(params[:id])
    @game.players.exists?(@user) ? @player = true : @player = false
    @user == @game.host ? @host = true : @host = false
  end
  
    
end
