class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :topic
      t.string :reward
      t.string :policy
      t.integer :type
      t.integer :privacy_flag
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
    add_index :themes, :privacy_flag
    add_index :themes, :user_id
    add_index :themes, :team_id
  end
end
