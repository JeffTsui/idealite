module IdeasHelper
    def is_idea_team?(team_id)
        @idea.is_team_idea?(team_id)
    end
    
    def is_my_idea?
        @idea.is_my_idea?(current_user.id)
    end
    
    def actor_path(post)
        @actor_path = nil
        @actor_id = post.post_actor.post_actor.id
        if post.post_actor.post_actor_type == "Team"
            @actor_path = team_path(@actor_id)
        elsif post.post_actor.post_actor_type == "User"
            @actor_path = user_path(@actor_id)
        end
        @actor_path
    end

    def link_options
        IdeaLink::LINK_OPTIONS
    end
    
    def joined_date (user_id)
        UserTeam.find_by(team_id: @idea.default_team.id, user_id: user_id).created_at
    end
    
end
