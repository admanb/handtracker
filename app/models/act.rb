class Act < ActiveRecord::Base
  belongs_to :card_state
  belongs_to :user
  belongs_to :game
  
  validates_inclusion_of :act_type, :in => %w(play_from_deck play_from_hand draw_to_hand give_to_player)
  
  RESTRICTED_TYPES = ['draw_to_hand', 'give_to_player']
  
  def restricted?
    return RESTRICTED_TYPES.include?(act_type)
  end
  
end
