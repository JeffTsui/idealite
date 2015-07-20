class AddRequestFlagToIdeaLink < ActiveRecord::Migration
  def change
    add_column :idea_links, :request_flag, :integer
  end
end
