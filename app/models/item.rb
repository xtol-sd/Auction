class Item < ActiveRecord::Base
  attr_accessible :description, :start_bid, :title, :image, :user_attributes
  belongs_to :user
  accepts_nested_attributes_for :user

  mount_uploader :image, ImageUploader
end
