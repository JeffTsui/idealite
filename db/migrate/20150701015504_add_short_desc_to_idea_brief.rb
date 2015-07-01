class AddShortDescToIdeaBrief < ActiveRecord::Migration
  def change
    add_column :idea_briefs, :short_desc, :string
    
    add_index :ideas, :idea_brief_id
  end
end
