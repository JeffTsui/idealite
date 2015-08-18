class ChangeTheme < ActiveRecord::Migration
  def change
    rename_column :themes, :topic, :title
    add_column :themes, :detail, :string
  end
end
