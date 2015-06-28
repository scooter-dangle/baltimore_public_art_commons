class AddRoleToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :role, :integer, default: 2
  end
end
