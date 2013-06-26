class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :start_bid

      t.timestamps
    end
  end
end
