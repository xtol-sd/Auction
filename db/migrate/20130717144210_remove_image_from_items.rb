class RemoveImageFromItems < ActiveRecord::Migration
  def up
  	remove_column :items, :image, :string
  end

  def down
  	add_column :items, :image, :string
  end
end
