class AvailableCard < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card
end