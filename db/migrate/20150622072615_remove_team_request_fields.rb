class RemoveTeamRequestFields < ActiveRecord::Migration
  def change
    remove_column :team_requests, :direction, :requestor_id
  end
end
