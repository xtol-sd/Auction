class ChangeStartBidFromItems < ActiveRecord::Migration
  def up
  	remove_column :items, :start_bid, :integer
  	add_column :items, :start_bid, :decimal
  end

  def down
  	add_column :items, :start_bid, :integer
  	remove_column :items, :start_bid, :decimal
  end
end
