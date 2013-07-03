class AddCurrentEventToAuction < ActiveRecord::Migration
  def change
    add_column :events, :current, :boolean
  end
end
