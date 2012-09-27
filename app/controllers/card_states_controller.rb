class CardStatesController < ApplicationController

  before_filter :user_status

  def play
    @game = Game.find(params[:game_id])
    card = CardState.find(params[:id])
    @act = Act.new(:card_state => card, :game => @game, :user => @user, :act_type => 'play_from_hand', :position => @game.next_act_position)
    @act.save
    card.move_to_discard()
    redirect_to game_act_url(@game, @act)
  end
  
  #GET
  def give
    @game = Game.find(params[:game_id])
    @card = CardState.find(params[:id])
    @players = @game.all_players
  end
  
  #POST
  def give_card
    @game = Game.find(params[:game_id])
    card = CardState.find(params[:id])
    recipient = User.find(params[:recipient_id])
    @act = Act.new(:card_state => card, :game => @game, 
                   :user => @user, :act_type => 'give_to_player', 
                   :position => @game.next_act_position)
    @act.save()
    card.move_to_hand(recipient)
    redirect_to game_act_url(@game, @act)
  end

  #GET
  def move
    @game = Game.find(params[:game_id])
    @card = CardState.find(params[:id])
    @decks = @game.decks.reject{|d| d == @card.deck}
  end

  #POST
  def move_card
    @game = Game.find(params[:game_id])
    card = CardState.find(params[:id])
    act_type = ''
    if(params[:destination] == 'deck_top')
      card.move_to_draw(:top)
      act_type = 'move_to_draw'
    elsif (params[:destination] == 'deck_bottom')
      card.move_to_draw(:bottom)
      act_type = 'move_to_draw'
    elsif (params[:destination] == 'discard')
      card.move_to_discard()
      act_type = 'move_to_discard'
    elsif (params[:destination] == 'different_deck')
      new_deck = Deck.find(params[:deck_id])
      card.move_to_deck(new_deck)
      act_type = 'move_to_different_deck'
    end
    @act = Act.new(:card_state => card, :game => @game, 
                   :user => @user, :act_type => act_type, 
                   :position => @game.next_act_position)
    @act.save()
    redirect_to game_act_url(@game, @act)
  end

  private

  def user_status
    @game = Game.find(params[:game_id])
    card = CardState.find(params[:id])
    if !(@game.players.exists?(@user) || @game.host == @user)
      flash[:notice] = 'You are not a player in that game.'
      @user ? redirect_to(@user) : redirect_to(login_url)
    elsif !(card.user == @user) && !(@game.host == @user)
      flash[:notice] = 'You do not have that card.'
      redirect_to(@game)
    end
  end
end