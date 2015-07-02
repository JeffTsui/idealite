class ChangeIdeaColumn < ActiveRecord::Migration
  def change
    rename_column :ideas, :created_by, :user_id
    add_index :ideas, :user_id
  end
end
