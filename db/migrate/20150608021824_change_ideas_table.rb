class ChangeIdeasTable < ActiveRecord::Migration
  def change
    rename_column :ideas, :user_id, :created_by
    remove_column :ideas, :title
    remove_column :ideas, :detail
    
    add_column :ideas, :privacy_flag, :string
  end
end
