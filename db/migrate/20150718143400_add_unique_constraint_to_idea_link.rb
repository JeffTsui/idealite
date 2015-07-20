class AddUniqueConstraintToIdeaLink < ActiveRecord::Migration
  def change
    add_index :idea_links, [:idea_id, :idea_linked_id, :user_id], unique: true
  end
end
