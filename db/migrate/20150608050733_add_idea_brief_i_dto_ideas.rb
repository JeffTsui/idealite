class AddIdeaBriefIDtoIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :idea_brief_id, :integer
  end
end
