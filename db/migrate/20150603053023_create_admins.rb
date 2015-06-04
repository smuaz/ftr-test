class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :name
      t.string :phone
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :status
      t.string :slug
      
      t.timestamps
    end
  end
end
