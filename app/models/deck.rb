class Deck < ActiveRecord::Base
  belongs_to :game
  has_many :available_cards, :order => :position
  has_many :discarded_cards, :order => :position
  has_many :card_in_hands
  has_many :availables, :through => :available_cards, :source => :card, :order => :position
  has_many :discards, :through => :discarded_cards, :source => :card, :order => :position
  has_many :in_hands, :through => :card_in_hands, :source => :card
  
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
                      
  def self.new_from_template(template_id)
    deck = Deck.new()
    pos = 0
    template = Template.find(template_id)
    template.cards.each do |c|
      card = AvailableCard.new(:card => c, :deck => deck, :position => pos)
      deck.available_cards << card
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
