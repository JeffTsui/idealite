class AddLinkTypeToThemeIdea < ActiveRecord::Migration
  def change
    add_column :theme_ideas, :link_type, :integer
    add_index :theme_ideas, :link_type
  end
end
