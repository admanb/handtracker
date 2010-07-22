class DecksController < ApplicationController
  
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
    shuffle(@deck)
    redirect_to game_url(@game)
  end

  def draw
    @deck = Deck.find(params[:id])
    @game = Game.find(params[:game_id])
    drawn_card = @deck.availables[0]
    @deck.availables.delete(drawn_card)
    if(params[:hand] == '1')
      @draw = Draw.new(:card => drawn_card, :game => @game, :user => @user)
      @draw.save
      hand_card = CardInHand.new(:deck => @deck, :card => drawn_card, :user => @user)
      hand_card.save
    else
      @play = Play.new(:card => drawn_card, :game => @game, :user => @user)
      @play.save
      discard = DiscardedCard.new(:deck => @deck, :card => drawn_card, :position => DiscardedCard.find_new_position(@deck))
      @deck.discarded_cards << discard
    end
    if @deck.availables.empty?
      shuffle(@deck)
    else
      @deck.save
      @deck.available_cards.each do |a|
        a.update_attribute(:position, a.position-1)
      end
    end
    if(params[:hand] == '1') 
      redirect_to game_draw_url(@game, @draw)
    else
      redirect_to game_play_url(@game, @play)
    end
  end
  
  def play
    @deck = Deck.find(params[:id])
    @game = Game.find(params[:game_id])
    @card = Card.find(params[:card_id])
    @play = Play.new(:card => @card, :game => @game, :user => @user)
    @play.save
    discard = DiscardedCard.new(:deck => @deck, :card => @card, :position => DiscardedCard.find_new_position(@deck))
    @deck.discarded_cards << discard
    @user.cards.delete(@card)
    @deck.save
    @user.save
    redirect_to game_play_url(@game, @play)
  end
  
  private

  def shuffle(deck)
    old_cards = deck.availables + deck.discards
    n = 0
    cards = []
    old_cards.each do |card|
      new_card = AvailableCard.new(:card => card, :position => n)
      cards << new_card
      n = n+1
    end
    1000.times do 
      card_a = rand(cards.length)
      card_b = rand(cards.length)
      pos_a = cards[card_a].position
      pos_b = cards[card_b].position
      cards[card_a].position = pos_b
      cards[card_b].position = pos_a
    end
    cards.each do |card|
      card.save
    end
    deck.discards.clear
    deck.available_cards = cards
    deck.save
  end
  
  # # DELETE /decks/1
  # # DELETE /decks/1.xml
  # def destroy
  #   @deck = Deck.find(params[:id])
  #   @deck.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(decks_url) }
  #     format.xml  { head :ok }
  #   end
  # end
  
  
  # POST /decks
  # POST /decks.xml
  # def create
  #   @deck = Deck.new(params[:deck])
  # 
  #   respond_to do |format|
  #     if @deck.save
  #       flash[:notice] = 'Deck was successfully created.'
  #       format.html { redirect_to(@deck) }
  #       format.xml  { render :xml => @deck, :status => :created, :location => @deck }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @deck.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # # GET /decks/1
  # # GET /decks/1.xml
  # def show
  #   @deck = Deck.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @deck }
  #   end
  # end
  # 
  # # GET /decks/new
  # # GET /decks/new.xml
  # def new
  #   @deck = Deck.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @deck }
  #   end
  # end

end
