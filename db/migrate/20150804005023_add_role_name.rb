class AddRoleName < ActiveRecord::Migration
  def change
    add_column :user_team_roles, :role_name, :string
    add_column :user_team_roles, :open_number, :integer
    add_index :user_team_roles, [:team_id, :role_id], unique: true
  end
end
