class Item < ActiveRecord::Base
  attr_accessible :description, :start_bid, :title, :image

  mount_uploader :image, ImageUploader
end
