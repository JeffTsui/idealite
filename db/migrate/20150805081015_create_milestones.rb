class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :idea_id
      t.date :start_date
      t.date :end_date
      t.integer :progress
      t.string :title
      t.text :detail
      t.boolean :critical_flag

      t.timestamps
    end
    add_index :milestones, :idea_id
  end
end
