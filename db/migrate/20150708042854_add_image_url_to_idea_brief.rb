class AddImageUrlToIdeaBrief < ActiveRecord::Migration
  def change
    add_column :idea_briefs, :image_url, :string
    add_index :idea_briefs, :user_id
  end
end
