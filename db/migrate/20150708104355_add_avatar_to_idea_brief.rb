class AddAvatarToIdeaBrief < ActiveRecord::Migration
  def change
    add_column :idea_briefs, :avatar, :string
  end
end
