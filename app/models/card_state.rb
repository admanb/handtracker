class CardState < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck
  belongs_to :user
  
  has_many :acts
  
  validates_inclusion_of :status, :in => %w(draw discard hand)
  
  def move_to_draw(position = :bottom) # will cause position gaps when moving from discard
    if(status != 'draw')
      if(position == :bottom)
        update_attributes(:status => 'draw', :user => nil, :position => deck.next_draw_position)
      elsif(position == :top)
        deck.shift_down()
        update_attributes(:status => 'draw', :user => nil, :position => 0)
      end
    end
  end
  
  def move_to_discard
    if(status != 'discard')
      update_attributes(:status => 'discard', :user => nil, :position => deck.next_discard_position)
    end
  end
  
  def move_to_hand(user)
    update_attributes(:status => 'hand', :user => user, :position => nil)
  end
  
  def move_to_deck(deck)
    update_attributes(:status => 'discard', :user => nil, :deck => deck, 
                      :position => deck.next_discard_position)
  end

end