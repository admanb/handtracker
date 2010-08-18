class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  
  def self.new_for_host(host, deck)
    return Permission.new(:user => host, :deck => deck, :can_shuffle => true, :can_give => true) # seems like there should be a better way to do this
  end
  
end
