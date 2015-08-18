class ChangeRoleIdutm < ActiveRecord::Migration
  def change
    rename_column :user_team_roles, :role, :role_id
  end
end
