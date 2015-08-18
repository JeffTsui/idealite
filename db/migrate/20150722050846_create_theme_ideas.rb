class CreateThemeIdeas < ActiveRecord::Migration
  def change
    create_table :theme_ideas do |t|
      t.integer :theme_id
      t.integer :idea_id
      t.integer :score

      t.timestamps
    end
    add_index :theme_ideas, :theme_id
    add_index :theme_ideas, :idea_id
  end
end
