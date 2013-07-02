class Item < ActiveRecord::Base
  attr_accessible :description, :start_bid, :title, :image, :user_attributes
  belongs_to :user
  has_many :bids
  accepts_nested_attributes_for :bids
  accepts_nested_attributes_for :user
  mount_uploader :image, ImageUploader

  def highest_bid(current_bid)
  	  bids.each do |bid|
  		  if bid.bid_amount >= current_bid
  			  current_bid = bid.bid_amount
  		  end
  	  end
    current_bid
  end
end
