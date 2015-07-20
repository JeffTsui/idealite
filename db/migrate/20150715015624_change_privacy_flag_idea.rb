class ChangePrivacyFlagIdea < ActiveRecord::Migration
  def change
    change_column :ideas, :privacy_flag, :integer
    add_index :ideas, :privacy_flag
  end
end
