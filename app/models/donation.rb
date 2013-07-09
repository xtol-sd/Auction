class Donation < ActiveRecord::Base
  attr_accessible :item_id, :user_id
  belongs_to :item
end
