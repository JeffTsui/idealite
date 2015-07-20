class CreateIdeaLinks < ActiveRecord::Migration
  def change
    create_table :idea_links do |t|
      t.integer :idea_source_id
      t.integer :idea_target_id
      t.integer :user_id

      t.timestamps
    end
    add_index :idea_links, :idea_source_id
    add_index :idea_links, :idea_target_id
  end
end
