class Play < ActiveRecord::Base
  belongs_to :card
  belongs_to :user
  belongs_to :game
end
