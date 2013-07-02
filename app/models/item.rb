class Item < ActiveRecord::Base
  attr_accessible :description, :start_bid, :title, :image, :user_attributes
  
  belongs_to :event
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

  def my_highest_bid(current_user, item_id, my_bid)
  	  bids.each do |bid|
  	  	if current_user.id == bid.user_id 
  	  		if item_id == bid.item_id
  		  		if bid.bid_amount >= my_bid
  			  		my_bid = bid.bid_amount
  		 		end
  	  		end
  		end
  	end
   my_bid
  end
   
end
