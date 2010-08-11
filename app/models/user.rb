class User < ActiveRecord::Base
  has_and_belongs_to_many :games, :join_table => 'players_games'
  has_many :hosted, :class_name => 'Game', :foreign_key => 'host_id'
  has_many :templates
  
  has_many :card_states
  
  has_many :acts
  
  validates_presence_of :login, :password
  validates_confirmation_of :password
  validates_uniqueness_of :login
  
  def get_hand(game)
    return card_states.find_all {|s| s.deck.game == game}
  end
  
end
