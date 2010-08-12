class Deck < ActiveRecord::Base
  belongs_to :game
  
  has_many :card_states, :order => :position, :dependent => :destroy

  def next_draw_position
    max = get_draw.max {|a,b| a.position <=> b.position}
    if max
      return max.position + 1
    else
      return 0
    end
  end
  
  def next_discard_position
    max = get_discard.max {|a,b| a.position <=> b.position}
    if max
      return max.position + 1
    else
      return 0
    end
  end
  
  def get_draw
    return card_states.find_all {|s| s.status == 'draw'}
  end
  
  def get_discard
    return card_states.find_all {|s| s.status == 'discard'}
  end
        
  def first_card
    return get_draw[0]
  end     
  
  def empty_draw?
    return get_draw == [] ? true : false
  end
  
  def shuffle
    cards = get_draw + get_discard
    if cards != nil # it's possible that every card in the deck will be in some player's hand
      cards.each do |card|
        if(card.status == 'discard')
          card.move_to_draw()
        end
      end
      1000.times do 
        card_a = rand(cards.length)
        card_b = rand(cards.length)
        pos_a = cards[card_a].position
        pos_b = cards[card_b].position
        cards[card_a].position = pos_b
        cards[card_b].position = pos_a
      end
      cards.each {|card| card.save()}
    end
  end
              
  def self.new_from_template(template_id)
    pos = 0
    template = Template.find(template_id)
    deck = Deck.new(:name => template.name)
    template.cards.each do |c|
      card_state = CardState.new(:card => c, :deck => deck, :position => pos)
      deck.card_states << card_state
      pos = pos+1
    end
    return deck
  end
end
