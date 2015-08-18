class CreateIdeaSurveys < ActiveRecord::Migration
  def change
    create_table :idea_surveys do |t|
      t.integer :idea_id
      t.integer :survey_id

      t.timestamps
    end
    add_index :idea_surveys, :idea_id
    add_index :idea_surveys, :survey_id
    add_index :idea_surveys, [:idea_id, :survey_id], unique: true
  end
end
