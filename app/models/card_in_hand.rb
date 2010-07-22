class CardInHand < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  belongs_to :card
end