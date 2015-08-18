class AddDescToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :desc, :string
  end
end
