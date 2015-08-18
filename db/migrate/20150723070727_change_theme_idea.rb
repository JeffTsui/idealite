class ChangeThemeIdea < ActiveRecord::Migration
  def change
    rename_column :theme_ideas, :score, :user_id
  end
end
