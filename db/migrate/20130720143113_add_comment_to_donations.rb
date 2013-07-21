class AddCommentToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :comment, :string
  end
end
