class CreateTeamRequests < ActiveRecord::Migration
  def change
    create_table :team_requests do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :direction
      t.integer :requester_id
      t.integer :approver_id
      t.integer :action

      t.timestamps
    end
  end
end
