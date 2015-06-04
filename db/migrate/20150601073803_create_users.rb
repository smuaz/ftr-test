class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :nickname
      t.text :address
      t.string :city
      t.integer :postcode
      t.integer :state_id
      t.string :country
      t.integer :nric
      t.string :phone
      t.string :email
      t.string :password_digest
      t.string :slug
      
      t.timestamps
    end
  end
end
