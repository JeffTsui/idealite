class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :title
      t.text :detail
      t.integer :owner_id

      t.timestamps
    end
  end
end
