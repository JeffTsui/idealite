module IdeasHelper
    def is_idea_team?(team_id)
        @idea.is_team_idea?(team_id)
    end
    
    def is_my_idea?
        @idea.is_my_idea?(current_user.id)
    end
end
