class Game < ActiveRecord::Base
  has_and_belongs_to_many :players, :class_name => 'User', :join_table => 'players_games'
  belongs_to :host, :class_name => 'User'
  has_many :decks, :dependent => :destroy
  has_many :acts
  
  validates_presence_of :title
  validates_uniqueness_of :title
  
  def all_players
    return players.to_a << host
  end
  
  def next_act_position
    max = acts.max {|a,b| a.position <=> b.position}
    if max
      return max.position + 1
    else
      return 0
    end
  end
  
  def all_acts
    return acts
  end
  
  def visible_acts(player)
    return acts.find_all {|act| act.user == player || !act.restricted?}
  end
  
end
