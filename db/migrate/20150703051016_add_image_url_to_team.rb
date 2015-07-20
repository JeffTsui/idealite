class AddImageUrlToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :image_url, :string
    add_index :teams, :user_id
  end
end
