class TeamRequest < ActiveRecord::Base
    include PublicActivity::Model
    tracked owner: :requester, recipient: :user
    
    belongs_to :team
    belongs_to :user
    belongs_to :requester, class_name: "User"
    belongs_to :approver, class_name: "User"
    belongs_to :role, class_name: "UserTeamRole"
    
    def accept_request(user_id)
        update_attributes(:action=>3, :approver_id=>user_id)
    end

    def ignore_request(user_id)
        update_attributes(:action=>2, :approver_id=>user_id)
    end
    
    def self.toggle_apply(team_id, role_id, user_id)
        tr = self.find_by(team_id: team_id, role_id: role_id, user_id: user_id)
        if tr.nil? #not applied yet
            self.new_request(team_id, role_id, user_id) #new request
        else
            tr.destroy #delete existing request
        end
    end
    
    def self.new_request(team_id, role_id, user_id)
        tr = self.new
        tr.update_attributes(team_id: team_id, role_id: role_id, user_id: user_id, 
            requester_id: user_id, action: 1)
        tr.save
    end
    
    def self.team_request_activities(user_id)
        tra = PublicActivity::Activity.where(recipient_id: user_id)
        return tra
    end
    
    def self.pending_requests(user_id)
        TeamRequest.joins("left join user_teams on user_teams.team_id = team_requests.team_id").
            where("user_teams.user_id = ? and user_teams.role_id = ?", user_id, 0).
            order("team_requests.created_at DESC")
    end

    def self.my_requests(user_id)
        pr = TeamRequest.where(requester_id:user_id, action:[0,1])
        return pr
    end
end
