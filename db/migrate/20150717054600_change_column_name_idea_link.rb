class ChangeColumnNameIdeaLink < ActiveRecord::Migration
  def change
    rename_column :idea_links, :idea_source_id, :idea_id
    rename_column :idea_links, :idea_target_id, :idea_linked_id
  end
end
