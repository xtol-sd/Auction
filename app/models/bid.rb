class Bid < ActiveRecord::Base
  attr_accessible :bid_amount, :item_id, :user_id
  belongs_to :user
  belongs_to :item
  accepts_nested_attributes_for :user
end
