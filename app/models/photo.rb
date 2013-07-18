class Photo < ActiveRecord::Base
  attr_accessible :image, :item_id

  belongs_to :item
  mount_uploader :image, ImageUploader
end
