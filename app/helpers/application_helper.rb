module ApplicationHelper
    def parent_layout(layout)
        @view_flow.append(:layout, self.output_buffer)
        output = render(file: "layouts/#{layout}")
        self.output_buffer = ActionView::OutputBuffer.new(output)
    end
    
    def team_notification_count
        @team_notifications = TeamRequest.team_request_activities(current_user.id)
        @team_notifications? @team_notifications.count : 0
    end
end
