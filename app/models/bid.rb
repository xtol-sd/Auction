class Bid < ActiveRecord::Base
  attr_accessible :bid_amount, :item_id
  belongs_to :user
  belongs_to :item
  accepts_nested_attributes_for :user

  validates :bid_amount, :numericality => {:greater_than => :top_bid}
  validates_presence_of :bid_amount, :item_id, :user_id

  def top_bid
    item.bids.map(&:bid_amount).max || item.start_bid
  end

end