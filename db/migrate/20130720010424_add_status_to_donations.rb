class AddStatusToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :status, :integer
  end
end
