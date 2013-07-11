class Bid < ActiveRecord::Base
  attr_accessible :bid_amount, :item_id, :user_id #user_id not in bid table
  belongs_to :user
  belongs_to :item
  accepts_nested_attributes_for :user

  validates :bid_amount, :numericality => {:greater_than => :next_minimum_bid}
  validates_presence_of :bid_amount, :item_id, :user_id

  def next_minimum_bid
    item.bids.map(&:bid_amount).max + 4 || item.start_bid - 1
  end

end