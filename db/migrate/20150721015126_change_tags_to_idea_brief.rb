class ChangeTagsToIdeaBrief < ActiveRecord::Migration
  def change
    rename_column :idea_briefs, :tags, :idea_tags
  end
end
