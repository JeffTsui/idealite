class TeamRequest < ActiveRecord::Base
    include PublicActivity::Model
    tracked owner: :requester, recipient: :user
    
    belongs_to :team
    belongs_to :user
    belongs_to :requester, class_name: "User"
    belongs_to :approver, class_name: "User"
    
    def accept_request(user_id)
        update_attributes(:action=>3, :approver_id=>user_id)
    end

    def ignore_request(user_id)
        update_attributes(:action=>2, :approver_id=>user_id)
    end
    
    def self.team_request_activities(user_id)
        tra = PublicActivity::Activity.where(recipient_id: user_id)
        return tra
    end
    
    def self.pending_requests(user_id)
        pr = TeamRequest.where(user_id:user_id, action:0)
        return pr
    end

    def self.my_requests(user_id)
        pr = TeamRequest.where(requester_id:user_id, action:[0,1])
        return pr
    end
end
