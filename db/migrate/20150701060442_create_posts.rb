class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :idea_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
    add_index :posts, :idea_id
    add_index :posts, :user_id
  end
end
