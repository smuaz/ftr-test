class AddAdminAndStatusToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :status_id, :integer
    add_column :complaints, :admin_id, :integer
    add_column :complaints, :type_id, :integer
    remove_column :complaints, :type
  end
end
