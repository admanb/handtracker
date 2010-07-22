class User < ActiveRecord::Base
  has_and_belongs_to_many :games, :join_table => 'players_games'
  has_many :hosted, :class_name => 'Game', :foreign_key => 'host_id'
  has_many :draws
  has_many :plays
  has_many :templates
  has_many :card_in_hands
  has_many :cards, :through => :card_in_hands
  
  validates_presence_of :login, :password
  validates_confirmation_of :password
  validates_uniqueness_of :login
  
end
