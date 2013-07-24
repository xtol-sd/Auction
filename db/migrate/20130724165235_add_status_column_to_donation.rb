class AddStatusColumnToDonation < ActiveRecord::Migration
  def change
  	add_column :donations, :status_created_at, :datetime
  end
end
