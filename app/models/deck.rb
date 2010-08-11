class Deck < ActiveRecord::Base
  belongs_to :game
  
  has_many :card_states, :order => :position, :dependent => :destroy
  
  @runewars_cards =  ["Dragon -	Triangle: nothing,	Rectangle: 2 Rout,	Circle: Orb,	Hexagon: 2 Dmg",
                      "Dragon -	Triangle: nothing,	Rectangle: 2 Rout,	Circle: Orb,	Hexagon: 1 Dmg",
                      "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Dmg,",
                      "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: nothing",
                      "Sun -	Triangle: 1 Rout,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: nothing",
                      "Dragon -	Triangle: 1 Rout,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: Orb",
                      "Sun -	Triangle: 1 Rout,	Rectangle: nothing,	Circle: nothing,	Hexagon: Orb",
                      "Dragon -	Triangle: 1 Rout,	Rectangle: 1 Rout,	Circle: nothing,	Hexagon: 3 Dmg",
                      "Dragon -	Triangle: Orb,	Rectangle: 1 Rout,	Circle: nothing,	Hexagon: 3 Dmg",
                      "Dragon -	Triangle: Orb,	Rectangle: 1 Rout,	Circle: nothing,	Hexagon: 2 Dmg",
                      "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 2 Dmg",
                      "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 1 Dmg",
                      "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Dmg",
                      "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Dmg",
                      "Shield -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Rout,	Hexagon: nothing",
                      "Dragon -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Rout,	Hexagon: Orb",
                      "Sun -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: nothing,	Hexagon: Orb",
                      "Dragon -	Triangle: 1 Dmg,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 3 Dmg",
                      "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: nothing",
                      "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Dmg",
                      "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 2 Rout",
                      "Dragon -	Triangle: nothing,	Rectangle: 2 Dmg,	Circle: Orb,	Hexagon: 2 Rout",
                      "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: 1 Rout",
                      "Shield -	Triangle: nothing,	Rectangle: Orb,	Circle: Orb,	Hexagon: nothing",
                      "Shield -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: nothing",
                      "Dragon -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: 1 Dmg,	Hexagon: Orb",
                      "Sun -	Triangle: 1 Dmg,	Rectangle: nothing,	Circle: nothing,	Hexagon: Orb",
                      "Dragon -	Triangle: 1 Dmg,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Rout",
                      "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Rout",
                      "Dragon -	Triangle: Orb,	Rectangle: 1 Dmg,	Circle: nothing,	Hexagon: 2 Rout"]
      
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
              
  def self.new_from_template(template_id)
    deck = Deck.new()
    pos = 0
    template = Template.find(template_id)
    template.cards.each do |c|
      card_state = CardState.new(:card => c, :deck => deck, :position => pos)
      deck.card_states << card_state
      pos = pos+1
    end
    return deck
  end
  
  
  def self.new_runewars()
    deck = Deck.new()
    pos = 0
    @runewars_cards.each do |s|
      card = Card.new(:text => s, :position => pos)
      deck.cards << card
      pos = pos+1
    end
    return deck
  end
end
