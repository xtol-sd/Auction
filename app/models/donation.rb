class Donation < ActiveRecord::Base
  attr_accessible :item_id, :user_id, :status, :comment, :hidden, :status_created_at
  belongs_to :item

end
