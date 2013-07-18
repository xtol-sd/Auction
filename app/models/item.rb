class Item < ActiveRecord::Base
  attr_accessible :description, :start_bid, :title, :event_id 
  attr_accessible :user_attributes, :donation_attributes, :photos_attributes

  belongs_to :event
  belongs_to :user
  has_many :bids
  has_one :donation
  has_many :photos
  
  accepts_nested_attributes_for :bids
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :donation
  accepts_nested_attributes_for :photos

  default_scope order("created_at DESC")  

  validates :start_bid, :numericality => {:only_integer => true, :message => "Please enter a number with no symbols"}

  validates_presence_of :title, :description, :start_bid

  #will need to be changed when more than one photo is implemented
  def find_thumb_photo_url
    self.photos.each do |photo|
      return photo.image_url(:thumb)
    end
  end

  def find_photo_url
    self.photos.each do |photo|
      return photo.image_url
    end
  end

  def next_allowed_bid
    # if then statement abbreviation
    offset = !bids.empty? ? 5:0
    next_allowed_bid = top_bid_amount + offset
  end

  def top_bid_me?(current_user_id) 
    if !top_bid
      false
    else
      top_bid.user_id == current_user_id
    end 
  end
#this returns the top bid record, looks for the top bid amount row...not the particular bid value
  def top_bid
    bids(:bid_amount).max
  end
#do we need self in this next method since it is in item model already? and called by item.top_bid_amount
  def top_bid_amount
    self.bids.map(&:bid_amount).max || self.start_bid
  end
#next two methods should be deleted after my bids refactor
  def bid_upon?(item)
    item_bids = Bid.find_all_by_item_id(item.id)
    if !item_bids.nil?
      true
    end  
  end

  def no_bids?(item)
    item_bids = Bid.find_all_by_item_id(item.id)
    if item_bids.empty?
      true
    end
  end
#next two replaced by top bid and top bid amount, delete now?
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
#replaced by top_bid_me? method at top of this model...can delete now?
  def current_user_won?(current_user)
    if self.event.end_datetime < DateTime.now 
      if my_highest_bid(current_user, id, self.start_bid) == highest_bid(start_bid)      
        true
      end
    end
  end

end
