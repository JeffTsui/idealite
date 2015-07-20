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
    
    def like_css
        current_user.likes?(@idea) ? "idea-title-fa-liked" : "idea-title-fa-notliked"
    end

    def follow_css
        current_user.follows?(@idea) ? "idea-title-fa-liked" : "idea-title-fa-notliked"
    end
    
    def idea_privacy_icon(privacy_flag)
        idea_privacy_icon_label(privacy_flag)[:icon]
    end
    
    def idea_privacy_label(privacy_flag)
        idea_privacy_icon_label(privacy_flag)[:label]
    end
    
    def link_options
        IdeaLink::LINK_OPTIONS
    end
    
    #Show link option label depends on value
    def link_label(value)
        logger.debug "link_label value = #{value}".light_yellow
        options = link_options.select {|option| option[:value] == value}
        # for link types value that doesn't have negative pair, search by abs
        if options.empty?
            options = link_options.select {|option| option[:value] == abs(value)}
        end
        return options[0][:label]
    end

    private 
    def idea_privacy_icon_label(privacy_flag)
        hash = nil
        if privacy_flag == 0
            hash = {icon:"fa fa-user-secret", label:"Only Me"}
        elsif privacy_flag == 1
            hash = {icon:"fa fa-lock", label:"Team"}
        elsif privacy_flag == 2
            hash = {icon:"fa fa-globe", label:"Public"}
        end
        return hash
    end
end
