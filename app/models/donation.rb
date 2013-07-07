class Donation < ActiveRecord::Base
  attr_accessible :item_id, :user_id

  belongs_to :user
  has_one :item
  
end
