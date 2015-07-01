class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :ideas, :owner_id, :user_id
  end
end
