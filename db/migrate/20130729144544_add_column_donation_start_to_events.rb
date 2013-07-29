class AddColumnDonationStartToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :donations_startdate, :datetime
  end
end
