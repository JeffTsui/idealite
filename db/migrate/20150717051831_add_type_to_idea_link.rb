class AddTypeToIdeaLink < ActiveRecord::Migration
  def change
    add_column :idea_links, :link_type, :integer
    add_index :idea_links, :link_type
  end
end
