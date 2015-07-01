class CreateIdeaBriefs < ActiveRecord::Migration
  def change
    create_table :idea_briefs do |t|
      t.string :title
      t.string :problem
      t.string :target
      t.string :how
      t.string :result
      t.string :risk
      t.integer :user_id

      t.timestamps
    end
  end
end
