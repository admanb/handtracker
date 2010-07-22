class Template < ActiveRecord::Base
  has_many :cards
  belongs_to :user
  
  def self.find_public_and_own(user_id)
    find(:all, :conditions => [ "public = 't' OR user_id = ?", user_id])
  end
  
  def self.find_all_by_public(pub)
    # heroku didn't seem big on attribute-based finders, so we're hacking it
    find(:all, :conditions => ["public = ?", pub])
  end
  
end
