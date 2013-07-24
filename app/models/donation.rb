class Donation < ActiveRecord::Base
  attr_accessible :item_id, :user_id, :status, :comment, :hidden, :status_created_at
  belongs_to :item

  def update_status_date
    return unless status == '0'
    self.status_created_at = Time.now
    self.save!
  end
  
end
