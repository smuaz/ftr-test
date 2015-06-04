class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :detail
      t.string :type
      t.string :slug
      t.integer :user_id
      t.integer :category_id
      t.integer :state_id

      t.timestamps
    end
  end
end
