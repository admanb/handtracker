class Act < ActiveRecord::Base
  belongs_to :card_state
  belongs_to :user
  belongs_to :game
  
  validates_inclusion_of :act_type, :in => %w(play_from_deck play_from_hand draw_to_hand 
                                              give_to_player move_to_draw move_to_discard
                                              move_to_different_deck)
  
  RESTRICTED_TYPES = ['draw_to_hand', 'give_to_player', 'move_to_discard', 'move_to_draw, move_to_different_deck']
  
  def restricted?
    return RESTRICTED_TYPES.include?(act_type)
  end
  
  def to_str()
    if act_type == 'draw_to_hand'
      return 'drew a card into his hand'
    elsif act_type == 'play_from_hand'
      return 'played a card from his hand'
    elsif act_type == 'play_from_deck'
      return 'played a card from the deck'
    elsif act_type == 'give_to_player'
      return 'gave a card to another player'
    elsif act_type == 'move_to_draw'
      return 'moved a card to the draw pile'
    elsif act_type == 'move_to_discard'
      return 'moved a card to the discard pile' 
    elsif act_type == 'move_to_different_deck'
      return 'moved a card to the discard pile of a different deck'
    end
  end

end
