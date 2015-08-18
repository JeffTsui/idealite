module ApplicationHelper
    #privacy options for Idea and Theme    
    PRIVACY_OPTIONS = [{value: 0, icon:"fa fa-user-secret", label:"Only Me"}, 
                        {value: 1, icon:"fa fa-lock", label:"Team"},                        
                        {value: 2, icon:"fa fa-globe", label:"Public"}]
    
    def parent_layout(layout)
        @view_flow.append(:layout, self.output_buffer)
        output = render(file: "layouts/#{layout}")
        self.output_buffer = ActionView::OutputBuffer.new(output)
    end
    
    def current_idea
        Idea.find(session[:idea_id])
    end
    
    def team_notification_count
        @team_notifications = TeamRequest.team_request_activities(current_user.id)
        @team_notifications? @team_notifications.count : 0
    end

    def like_css(object)
        current_user.likes?(object) ? "idea-title-fa-liked" : "idea-title-fa-notliked"
    end

    def follow_css(object)
        current_user.follows?(object) ? "idea-title-fa-liked" : "idea-title-fa-notliked"
    end

    def privacy_icon(privacy_flag)
        privacy_icon_label(privacy_flag)[:icon] if privacy_flag
    end
    
    def privacy_label(privacy_flag)
        privacy_icon_label(privacy_flag)[:label] if privacy_flag
    end
    
    def privacy_options_for_select
        PRIVACY_OPTIONS.collect {|i| [i[:label], i[:value]]}
    end
    
    def idea_tags_limit(idea, limit)
        if limit
            idea.idea_brief.tag_list.take(limit)
        else
            idea.idea_brief.tag_list
        end
    end
    
    #Show link option label depends on value
    def link_label(value, link_options)
        options = link_options.find {|option| option[:value] == value}
        # for link types value that doesn't have negative pair, search by abs
        if !options
            options = link_options.find {|option| option[:value] == value.abs}
        end
        return options[:label]
    end
    
    def toggle_active_li(pane)
        active_pane?(pane)? "active" : ""
    end
    
    def toggle_active_tab(pane)
        active_pane?(pane)? "fade in active" : "fade"
    end

    private 
    def privacy_icon_label(privacy_flag)
        PRIVACY_OPTIONS.find {|i| i[:value] == privacy_flag}
    end

    #toggle bootstrap active tab
    def active_pane?(pane)
        if pane == "default" && params[:pane].nil?
            true
        else
            params[:pane] == pane
        end
    end
    
end
