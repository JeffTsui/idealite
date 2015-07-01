class CreateIdeaTeams < ActiveRecord::Migration
  def change
    create_table :idea_teams do |t|
      t.integer :idea_id
      t.integer :team_id
      t.integer :role_id

      t.timestamps
    end
    add_index :idea_teams, :idea_id
    add_index :idea_teams, :team_id
  end
end
