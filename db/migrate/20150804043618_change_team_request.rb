class ChangeTeamRequest < ActiveRecord::Migration
  def change
    add_column :team_requests, :role_id, :integer
    add_column :team_requests, :requester_comment, :string
    add_column :team_requests, :approver_comment, :string
    add_index :team_requests, [:team_id, :user_id, :role_id], unique: true
  end
end
