module TeamsHelper
    
    def teams_admined
      Team.teams_admined(current_user.id)
    end

    def teams_in
      Team.teams_membered(current_user.id)
    end
end
