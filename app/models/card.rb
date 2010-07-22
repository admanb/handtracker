class Card < ActiveRecord::Base
  has_many :available_cards # the 'has_many' language doesn't really work here
  has_many :discarded_cards
  has_many :card_in_hands
  has_many :decks_availables, :through => :available_cards, :source => :deck
  has_many :decks_discards, :through => :discarded_cards, :source => :deck
  has_many :decks_hands, :through => :card_in_hands, :source => :deck
  
  has_many :draws
  has_many :plays
  
  belongs_to :template
  #named_scope :available, :conditions => { :discarded => false }  this won't work
  validates_presence_of :text
  
end
