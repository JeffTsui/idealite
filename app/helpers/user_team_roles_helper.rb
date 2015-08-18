module UserTeamRolesHelper
    
    def apply_btn_label(role_id, user_id)
        team_request = TeamRequest.find_by(role_id: role_id, user_id: user_id)
        team_request.nil?? "Apply" : "Applied"
    end
end
