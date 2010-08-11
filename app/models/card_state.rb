class CardState < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck
  belongs_to :user
  
  has_many :acts
  
  validates_inclusion_of :status, :in => %w(draw discard hand)
  
  def move_to_draw
    if(status != 'draw')
      update_attributes(:status => 'draw', :user => nil, :position => deck.next_draw_position)
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
  
end