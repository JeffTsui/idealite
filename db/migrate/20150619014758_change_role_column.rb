class ChangeRoleColumn < ActiveRecord::Migration
  def change
    rename_column :roles, :type, :role_type
    rename_column :roles, :name, :role
  end
end
