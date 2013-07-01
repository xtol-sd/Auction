class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
