class RenameUsernameToNickname < ActiveRecord::Migration
  def change
    rename_column :admins, :username, :nickname
  end
end
