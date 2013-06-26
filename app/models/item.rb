class Item < ActiveRecord::Base
  attr_accessible :description, :start_bid, :title, :user_id
end
