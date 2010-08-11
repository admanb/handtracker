class Card < ActiveRecord::Base
  
  has_many :card_states
  
  belongs_to :template

  validates_presence_of :text
  
end
