class RemoveGroupsUsersTable < ActiveRecord::Migration
  def change
    drop_table :groups_users
  end
end
