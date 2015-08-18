class CreateUserTeamRoles < ActiveRecord::Migration
  def change
    create_table :user_team_roles do |t|
      t.integer :team_id
      t.integer :role
      t.string :desc
      t.boolean :open_flag

      t.timestamps
    end
    add_index :user_team_roles, :team_id
  end
end
