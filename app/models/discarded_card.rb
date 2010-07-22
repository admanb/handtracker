class DiscardedCard < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card
  
  def self.find_new_position(deck)
    highest = find_by_deck_id(deck, :order => 'position DESC')
    if highest
      return highest.position + 1
    else
      return 0
    end
  end
  
end