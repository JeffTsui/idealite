class TeamRequestsController < ApplicationController
    layout 'teams'
    respond_to :html, :js
    
    def index
        @team_requests = TeamRequest.all
        @pending_requests = TeamRequest.pending_requests(current_user.id)
        @my_requests = TeamRequest.my_requests(current_user.id)
        respond_with(@team_requests)
    end
    
    def update
        logger.debug "update request #{params[:action_type]}".light_yellow
        @action_type = params[:action_type]
        @team_request = TeamRequest.find(params[:id])
        if @action_type == "accept"
            @team_request.accept_request(current_user.id)
            UserTeam.create(user_id: current_user.id, team_id: @team_request.team.id, role_id: 1)
        elsif @action_type == "ignore"
            @team_request.ignore_request(current_user.id)
        end
    end
    
    def show
    end
end
