class UserTeam < ActiveRecord::Base
    belongs_to :user
    belongs_to :team
    
    def self.accept_request(team_request_id)
        tr = TeamRequest.find(team_request_id)
        user_team = self.find_or_initialize_by(user_id: tr.user_id, team_id: tr.team_id)
        user_team.update(role_id: tr.role_id)
    end
end
