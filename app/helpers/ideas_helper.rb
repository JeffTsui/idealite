module IdeasHelper
    def is_idea_team(team_id)
        @idea_teams = @idea.teams
        @idea_team_ids = @idea_teams.map{|i| i.id}
        @idea_team_ids.include? team_id
    end
end
