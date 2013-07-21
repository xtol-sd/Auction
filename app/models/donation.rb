class Donation < ActiveRecord::Base
  attr_accessible :item_id, :user_id, :status, :comment
  belongs_to :item
end
