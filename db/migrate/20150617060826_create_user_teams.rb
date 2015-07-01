class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.references :user
      t.references :team
      t.references :role

      t.timestamps
    end
  end
end
