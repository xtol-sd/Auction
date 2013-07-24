class AddColumnToDonation < ActiveRecord::Migration
  def change
  	add_column :donations, :hidden, :boolean
  end
end