class User < ActiveRecord::Base
  has_and_belongs_to_many :games, :join_table => 'players_games'
  has_many :hosted, :class_name => 'Game', :foreign_key => 'host_id'
  has_many :templates
  has_many :card_states
  has_many :acts
  has_many :permissions
  
  validates_presence_of :login, :password
  validates_confirmation_of :password
  validates_uniqueness_of :login
  
  def get_hand(game)
    return card_states.find_all {|s| s.deck.game == game}
  end
  
  def can(action, deck)
    p = permissions.find_by_deck_id(deck)
    return p.send('can_' + action)
  end
  
end
