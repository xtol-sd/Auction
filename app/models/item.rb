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

  validates :start_bid, :numericality => {:only_integer => true, :message => "Please enter a whole number with no symbols"}
  validates_presence_of :title, :description, :start_bid

  #will need to change next two methods when more than one photo is implemented
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

  def top_bid_amount
    self.bids.map(&:bid_amount).max || self.start_bid
  end

end