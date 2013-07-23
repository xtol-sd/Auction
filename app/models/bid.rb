class Bid < ActiveRecord::Base
  attr_accessible :bid_amount, :item_id
  belongs_to :user
  belongs_to :item
  accepts_nested_attributes_for :user
  default_scope order("created_at DESC")  

  validates_presence_of :item_id, :user_id

  validate :bid_amount_is_a_number?, :bid_amount_is_greater_than_next_minimum_bid? 

  def bid_amount_is_a_number? 
    errors.add(:bid_amount, "Must be at least this amount. Please enter a number without symbols.") if 
    bid_amount.nil?   
  end 

  def bid_amount_is_greater_than_next_minimum_bid? 
    errors.add(:bid_amount, "Must be at least this amount. Please enter a number without symbols.") if 
    !bid_amount.nil? && bid_amount >= next_minimum_bid 
  end

  def next_minimum_bid
    !item.bids.empty? ? (item.bids.map(&:bid_amount).max + 4):(item.start_bid - 1)
  end

end