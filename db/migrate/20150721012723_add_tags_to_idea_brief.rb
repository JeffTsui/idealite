class AddTagsToIdeaBrief < ActiveRecord::Migration
  def change
    add_column :idea_briefs, :tags, :string
  end
end
