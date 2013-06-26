class Bid < ActiveRecord::Base
  attr_accessible :bid_amount, :item_id, :user_id
end
