class DropRolesDictionary < ActiveRecord::Migration
  def up
    drop_table :roles
    drop_table :dictionary
  end
end
