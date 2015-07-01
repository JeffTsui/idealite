class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :table_name
      t.string :column_name
      t.integer :value
      t.string :descriptiopn
      t.timestamps
    end
  end
end
