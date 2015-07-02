class CreatePostActors < ActiveRecord::Migration
  def change
    drop_table :post_as
    create_table :post_actors do |t|
      t.integer :post_id
      t.string :post_actor_type
      t.string :post_actor_id

      t.timestamps
    end
    add_index :post_actors, :post_id
    add_index :post_actors, :post_actor_type
    add_index :post_actors, :post_actor_id
  end
end
