class UserTeamRole < ActiveRecord::Base
    belongs_to :team

    def self.role_desc(role_id)
        if role_id == 0 
            "Onwer"
        elsif role_id == 1
            "Member"
        else
            UserTeamRole.find(role_id).role_name
        end
    end
end
