class ChangeBidAmountToDecimalInBids < ActiveRecord::Migration
 def up
  	remove_column :bids, :bid_amount, :integer
  	add_column :bids, :bid_amount, :decimal
  end

  def down
  	add_column :bids, :bid_amount, :integer
  	remove_column :bids, :bid_amount, :decimal
  end
end
