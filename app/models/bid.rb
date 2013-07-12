class Bid < ActiveRecord::Base
  attr_accessible :bid_amount, :item_id, :user_id #user_id not in bid table
  belongs_to :user
  belongs_to :item
  accepts_nested_attributes_for :user
  default_scope order("created_at DESC")  

  validates_presence_of :bid_amount, :item_id, :user_id
  validates :bid_amount, :numericality => {:greater_than => :next_minimum_bid, :message => "Must be at least this amount" }

  def next_minimum_bid
  	!item.bids.empty? ? (item.bids.map(&:bid_amount).max + 4):(item.start_bid - 1)
  end

end