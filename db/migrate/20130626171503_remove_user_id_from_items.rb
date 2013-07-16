class RemoveUserIdFromItems < ActiveRecord::Migration
  def up
  	remove_column :items, :user_id, :integer
  end

  def down
  	add_column :items, :user_id, :integer
  end
end
