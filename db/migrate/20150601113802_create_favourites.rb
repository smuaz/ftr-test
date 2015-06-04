class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.boolean :favourite
      t.integer :user_id
      t.integer :complaint_id

      t.timestamps
    end
  end
end
