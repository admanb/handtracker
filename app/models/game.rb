class Game < ActiveRecord::Base
  has_and_belongs_to_many :players, :class_name => 'User', :join_table => 'players_games'
  belongs_to :host, :class_name => 'User'
  has_one :deck, :dependent => :destroy
  has_many :draws
  has_many :plays
  
  validates_presence_of :title
  validates_uniqueness_of :title
  
end
