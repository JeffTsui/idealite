class AddPidToPostAs < ActiveRecord::Migration
  def change
    add_column :post_as, :post_id, :integer
    
    add_index :post_as, :post_id
  end
end
