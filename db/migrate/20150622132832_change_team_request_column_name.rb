class ChangeTeamRequestColumnName < ActiveRecord::Migration
  def change
    create_table :dictionary do |t|
      t.string :table_name
      t.string :column_name
      t.integer :value
      t.string :description
      t.timestamps
    end
  end
end
