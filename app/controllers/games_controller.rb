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
    @decks = @game.decks
    @current_players = @game.all_players
    @available_players = User.find(:all) - @current_players
    if(@host)
      @acts = @game.all_acts
    else
      @acts = @game.visible_acts(@user)
    end
    @acts_first_five = @acts[0..4]
    @acts_rest = @acts[5..(@acts.length)]
    @hand = @user.get_hand(@game)
    @hand = @hand ? @hand : []
  end

  def add_player
    @player = User.find(params[:new_player_id])
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

  def change_player
    @game = Game.find(params[:id])
    new_player = User.find(params[:new_player_id])
    if params[:old_player_id] == 'add'
      @game.players << new_player
      @game.save
      flash[:notice] = "Player added."
      redirect_to(@game)
    else
      old_player = User.find(params[:old_player_id])    
      @game.replace_player(old_player, new_player)
      flash[:notice] = "Player replaced."
      redirect_to(@game)
    end
  end
  
  def remove_player
    @game = Game.find(params[:id])
    old_player = User.find(params[:old_player_id])
    @game.remove_player(old_player)
    flash[:notice] = "Player removed."
    redirect_to(@game)
  end

  def undo
    
  end
  
  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new
    @templates = Template.find_public_and_own(@user.id)
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    @templates = Template.find_public_and_own(@user.id)
  end

  # POST /games
  def create
    @game = Game.new(params[:game])
    @game.host = @user
    @game.decks << Deck.new_from_template(params[:template_id])
    if @game.save
      flash[:notice] = 'Game was successfully created.'
      redirect_to(@game)
    else
      render :action => "new"
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])
    @deck = Deck.new_from_template(params[:template_id])
    @game.decks << @deck
    if @game.save()
      flash[:notice] = 'Added a deck.'
      redirect_to game(@game)
    else
      render :action => "edit"
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to(user_url(@user))
  end
  
  private
  
  def user_status
    @game = Game.find(params[:id])
    @game.players.exists?(@user) ? @player = true : @player = false
    @user == @game.host ? @host = true : @host = false
    if !(@player || @host)
      flash[:notice] = 'You are not a player in that game.'
      @user ? redirect_to(@user) : redirect_to(login_url)
    end
  end
end
